import haxe.io.Encoding;
import haxe.io.Bytes;

class Response {
	public static function ok(content:String, type:String, encoding = Encoding.UTF8):Bytes {
		return Bytes.ofString('HTTP/1.1 200 OK\nContent-Type: ${type}\nContent-Length: ${content.length}\n\n${content}', encoding);
	}

	public static function okBytes(content:Bytes, type:String, encoding = Encoding.UTF8):Bytes {
		var tmp = Bytes.ofString('HTTP/1.1 200 OK\nContent-Type: ${type}\nContent-Length: ${content.length}\n\n', encoding);
		var result = Bytes.alloc(tmp.length + content.length);
		result.blit(0, tmp, 0, tmp.length);
		result.blit(tmp.length, content, 0, content.length);
		return result;
	}

	public static function notFound():Bytes {
		var content = 'File Not Found';
		return Bytes.ofString('HTTP/1.1 404 Not Found\nContent-Type: text/html\nContent-Length: ${content.length}\n\n${content}');
	}
}
