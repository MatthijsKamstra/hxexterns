package js.firebase.storage;

@:native("firebase.storage.UploadTaskSnapshot") extern class UploadTaskSnapshot {
	public var bytesTransferred:Int;
	public var downloadURL:String;
	public var metadata:js.firebase.storage.FullMetadata;
	public var ref:js.firebase.storage.Reference;
	public var state:js.firebase.storage.TaskState;
	public var task:js.firebase.storage.UploadTask;
	public var totalBytes:Int;
}