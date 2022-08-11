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
		socket.setTimeout(300);
		Sys.println('open our browser to localhost:${PORT}');

		while (true) {
			try {
				var client = socket.accept();
				client.setTimeout(300);
				client.waitForRead();
				var data = client.input.readLine().split(" ");
				trace(data);

				var response = manageRoute(data[1]);

				client.output.prepare(response.length);
				client.output.write(response);
				client.shutdown(true, true);
			} catch (e:Dynamic) {}
		}
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
			case "png": Response.okBytes(File.getBytes(file), "image/png");
			case _: Response.ok(File.getContent(file), "text/plain");
		};
	}
}
