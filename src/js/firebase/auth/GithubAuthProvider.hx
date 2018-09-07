package js.firebase.auth;

@:native("js.firebase.auth.GithubAuthProvider") extern class GithubAuthProvider extends AuthProvider {
	public static var PROVIDER_ID:String;

	public function new();

	public function credential(token:String):AuthCredential;
	public function addScope(scope:String):Void;
	public function setCustomParameters(parameters:Dynamic):Void;
}