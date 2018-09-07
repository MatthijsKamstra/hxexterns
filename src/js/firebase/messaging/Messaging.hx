package js.firebase.messaging;

@:native("firebase.messaging.Messaging") extern class Messaging {
	public function deleteToken(token:String):js.firebase.Promise<Dynamic>;
	public function getToken():js.firebase.Promise<String>;
	public function onMessage(nextOrObserver:Dynamic->Void):Void->Void;
	public function onTokenRefresh(nextOrObserver:Dynamic->Void):Void->Void;
	public function requestPermission():js.firebase.Promise<Dynamic>;
	public function setBackgroundMessageHandler(callback:Dynamic->Void):Void;
	public function useServiceWorker(registration:Dynamic):Dynamic;
}