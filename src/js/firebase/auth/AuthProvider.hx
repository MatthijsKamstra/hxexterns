package js.firebase.auth;

@:native("js.firebase.auth.AuthProvider") extern class AuthProvider {
	static var PROVIDER_ID:String;
	public function credential(email:String, password:String):AuthCredential;
}