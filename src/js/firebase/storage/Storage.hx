package js.firebase.storage;

@:native extern class Storage {
	public var app:js.firebase.app.App;
	public var maxOperationRetryTime:Int;
	public var maxUploadRetryTime:Int;

	public function ref(?path:String):js.firebase.storage.Reference;
	public function refFromURL(?url:String):js.firebase.storage.Reference;
	public function setMaxOperationRetryTime(time:Int):Void;
	public function setMaxUploadRetryTime(time:Int):Void;
}