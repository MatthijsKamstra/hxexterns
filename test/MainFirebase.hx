package;

import js.firebase.Firebase;
import js.firebase.app.App;
import js.firebase.*;

class MainFirebase {

	var firebase:App;

	var userId = 'foo';
	var postId = 'bar';
	var	name = "MatthijsKamstra";
	var email = "fake@morefake.nl";
	var imageUrl = "https://www.fake.nl/profile.png";


	public function new() {
		init0();
		init1();
		init2();
		init3();
		init7();
	}

	function init0(){
		var config = {
			apiKey: "api-key",
			authDomain: "domain.firebaseapp.com",
			databaseURL: "https://databaseurl.firebaseio.com",
			storageBucket: "bucket-id.appspot.com",
			messagingSenderId: "messaging-sender-id"
		};

		firebase = Firebase.initializeApp(config);
	}

	function init1(){
		firebase.database().ref("test").set("wow").then(function(e) {
			trace("Set value!");
		});
	}

	// https://firebase.google.com/docs/database/web/read-and-write?authuser=0
	function init2(){
		// Get a reference to the database service
		var database = Firebase.database();

		firebase.database().ref('users/' + userId).set({
		    username: name,
		    email: email,
		    profile_picture : imageUrl
		 });
	}
	function init3(){
		var starCountRef = firebase.database().ref('posts/' + postId + '/starCount');
		starCountRef.on('value', function(snapshot) {
			trace ("updateStarCount(postElement, snapshot.val())");
		});
		starCountRef.on(EventType.ChildMoved, function(snapshot) {
			trace ("test EventType.ChildMoved");
		});
	}


	function init7(){
		firebase.database().ref('users/' + userId).set({
			username: name,
			email: email,
			profile_picture : imageUrl
		}, function(error) {
			if (error != null) {
				trace ('The write failed...');
			} else {
				trace ('Data saved successfully!');
			}
		});
	}

	static public function main() {
		var main = new MainFirebase();
	}
}