package js.firebase.storage;

@:native("firebase.storage.Reference") extern class Reference {
	public var bucket:String;
	public var fullPath:String;
	public var name:String;
	public var parent:js.firebase.storage.Reference;
	public var root:js.firebase.storage.Reference;
	public var storage:js.firebase.storage.Storage;

	public function child(path:String):js.firebase.storage.Reference;
	public function delete():js.firebase.Promise<Void>;
	public function getDownloadURL():js.firebase.Promise<String>;
	public function getMetadata():js.firebase.Promise<js.firebase.storage.FullMetadata>;

	public function put(data:Dynamic, ?metadata:js.firebase.storage.UploadMetadata):UploadTask;
	public function putString(data:String, ?format:StringFormat, ?metadata:UploadMetadata):UploadTask;
	public function toString():String;

	public function updateMetadata(metadata:SettableMetadata):js.firebase.Promise<FullMetadata>;
}