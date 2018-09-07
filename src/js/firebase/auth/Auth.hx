package js.firebase.auth;

@:native("firebase.Auth") extern class Auth {
	public var app:js.firebase.app.App;
	public var currentUser:js.firebase.User;

	public function applyActionCode(code:String):js.firebase.Promise<Void>;
	public function checkActionCode(code:String):js.firebase.Promise<js.firebase.auth.ActionCodeInfo>;

	public function confirmPasswordReset(code:String, newPassword:String):js.firebase.Promise<Void>;

	public function createUserWithEmailAndPassword(email:String, password:String):js.firebase.Promise<js.firebase.User>;

	public function fetchProvidersForEmail(email:String):js.firebase.Promise<Array<String>>;

	public function getRedirectResult():js.firebase.Promise<js.firebase.auth.UserCredential>;

	public function onAuthStateChanged(nextOrObserver:js.firebase.User -> Void, opt_error:js.firebase.auth.Error -> Void = null, opt_completed: Void -> Void = null): Void -> Void;

	public function sendPasswordResetEmail(email:String):js.firebase.Promise<Void>;

	public function signInAnonymously():Promise<js.firebase.User>;
	public function signInWithCredential(credential:js.firebase.auth.AuthCredential):js.firebase.Promise<js.firebase.User>;
	public function signInWithCustomToken(token:String):js.firebase.Promise<js.firebase.User>;
	public function signInWithEmailAndPassword(email:String, password:String):js.firebase.Promise<js.firebase.User>;
	public function signInWithPopup(provider:AuthProvider):js.firebase.Promise<js.firebase.auth.UserCredential>;
	public function signInWithRedirect(provider:AuthProvider):js.firebase.Promise<Void>;

	public function signOut():js.firebase.Promise<Void>;

	public function verifyPasswordResetCode(code:String):js.firebase.Promise<String>;

}