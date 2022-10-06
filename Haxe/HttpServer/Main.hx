import haxe.io.Bytes;
import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;
import sys.net.Host;
import sys.net.Socket;

using StringTools;

class Main {
	public static var PORT = 8080;

	public static function main() {
		var socket = new Socket();
		socket.bind(new Host("localhost"), PORT);
		socket.listen(100);
		socket.setTimeout(300000);
		Sys.println('open our browser to localhost:${PORT}');

		while (true) {
			try {
				var client = socket.accept();
				client.setTimeout(300);
				client.waitForRead();
				var data = client.input.readLine().split(" ");
				trace(data);

				var response = manageRoute(data[1]);

				var chuncks = makeBytesChuncks(response, 256);

				client.output.prepare(response.length);
				for (chunck in chuncks) {
					client.output.write(chunck);
				}

				client.shutdown(true, true);
			} catch (e:Dynamic) {}
		}
	}

	public static function getBytesContent(filePath:String) {
		var size = FileSystem.stat(filePath).size;
		var fileInput = File.read(filePath, true);
		var bytes = fileInput.read(size);
		fileInput.close();
		return bytes;
	}

	public static function makeBytesChuncks(bytes:Bytes, size:Int) {
		var chuncksNumber = Math.floor(bytes.length / size);
		var remains = bytes.length - chuncksNumber * size;

		var chuncks:Array<Bytes> = [];

		for (pos in 0...chuncksNumber) {
			var truePos = pos * size;
			chuncks.push(bytes.sub(truePos, size));
		}

		if (remains > 0) {
			chuncks.push(bytes.sub(chuncksNumber * size, remains));
		}

		return chuncks;
	}

	public static function manageRoute(route:String) {
		if (route.contains("../")) {
			return Response.notFound();
		}

		var trueRoute = '.${route}';
		var isFile = !FileSystem.isDirectory(trueRoute);

		if (!FileSystem.exists(trueRoute)) {
			return Response.notFound();
		}

		if (isFile) {
			return getFile(trueRoute);
		}

		var fallback = '${trueRoute}/index.html';

		if (!FileSystem.exists(fallback)) {
			return Response.notFound();
		}

		return getFile(fallback);
	}

	public static function getFile(file:String) {
		var fileExtenston = Path.extension(file);

		return switch (fileExtenston.toLowerCase()) {
			case "html": Response.ok(File.getContent(file));
			case "png": Response.okBytes(getBytesContent(file), "image/png");
			case "jpg" | "jpeg": Response.okBytes(getBytesContent(file), "image/jpg");
			case _: Response.ok(File.getContent(file), "text/plain");
		};
	}
}
