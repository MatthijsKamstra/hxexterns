import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.html.svg.SVGElement;

@:jsRequire("qrcode")
@:native("QRCode")
extern class QRCode
{

	@:selfCall
	public function new():Void;

	@:overload(function(str:String, option:Dynamic, callback:Function):Void { })
	static public function toDataURL(str:String, callback:Function):Void;

}