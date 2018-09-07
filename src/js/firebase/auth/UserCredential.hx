package js.firebase.auth;

@:native("js.firebase.auth.UserCredential") extern class UserCredential {
	public var user:js.firebase.User;
	public var credential: js.firebase.auth.AuthCredential;
}