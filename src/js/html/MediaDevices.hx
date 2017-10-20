package js.html;

// https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia

@:native("MediaDevices")
extern class MediaDevices
{
	public function getUserMedia(constraints:Dynamic) : Promise<Dynamic>;
}