package js.firebase.app;

extern class App {
	public var name(default, null):String;
	public var options:Dynamic;
	public function auth():js.firebase.auth.Auth;
	public function database():js.firebase.database.Database;
	public function storage():js.firebase.storage.Storage;
	public function messaging():js.firebase.messaging.Messaging;
	public function delete():Dynamic;
}
