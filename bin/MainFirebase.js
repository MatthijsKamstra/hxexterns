// Generated by Haxe 3.4.7
(function () { "use strict";
var MainFirebase = function() {
	this.imageUrl = "https://www.fake.nl/profile.png";
	this.email = "fake@morefake.nl";
	this.name = "MatthijsKamstra";
	this.postId = "bar";
	this.userId = "foo";
	this.init0();
	this.init1();
	this.init2();
	this.init3();
	this.init4();
	this.init7();
};
MainFirebase.__name__ = true;
MainFirebase.main = function() {
	var main = new MainFirebase();
};
MainFirebase.prototype = {
	init0: function() {
		var config = { apiKey : "api-key", authDomain : "domain.firebaseapp.com", databaseURL : "https://databaseurl.firebaseio.com", storageBucket : "bucket-id.appspot.com", messagingSenderId : "messaging-sender-id"};
		this.firebase = firebase.initializeApp(config);
	}
	,init1: function() {
		this.firebase.database().ref("test").set("wow").then(function(e) {
			console.log("Set value!");
		});
	}
	,init2: function() {
		var database = firebase.database();
		this.firebase.database().ref("users/" + this.userId).set({ username : this.name, email : this.email, profile_picture : this.imageUrl});
	}
	,init3: function() {
		var starCountRef = this.firebase.database().ref("posts/" + this.postId + "/starCount");
		starCountRef.on("value",function(snapshot) {
			console.log("updateStarCount(postElement, " + Std.string(snapshot.val()) + ")");
		});
		starCountRef.on("child_moved",function(snapshot1) {
			console.log("test EventType.ChildMoved");
		});
	}
	,init4: function() {
		var userId = this.firebase.auth().currentUser.uid;
		return this.firebase.database().ref("/users/" + userId).once(null,null,"value").then(function(snapshot) {
		});
	}
	,init7: function() {
		this.firebase.database().ref("users/" + this.userId).set({ username : this.name, email : this.email, profile_picture : this.imageUrl},function(error) {
			if(error != null) {
				console.log("The write failed...");
			} else {
				console.log("Data saved successfully!");
			}
		});
	}
};
Math.__name__ = true;
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.__string_rec = function(o,s) {
	if(o == null) {
		return "null";
	}
	if(s.length >= 5) {
		return "<...>";
	}
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) {
		t = "object";
	}
	switch(t) {
	case "function":
		return "<function>";
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) {
					return o[0];
				}
				var str = o[0] + "(";
				s += "\t";
				var _g1 = 2;
				var _g = o.length;
				while(_g1 < _g) {
					var i = _g1++;
					if(i != 2) {
						str += "," + js_Boot.__string_rec(o[i],s);
					} else {
						str += js_Boot.__string_rec(o[i],s);
					}
				}
				return str + ")";
			}
			var l = o.length;
			var i1;
			var str1 = "[";
			s += "\t";
			var _g11 = 0;
			var _g2 = l;
			while(_g11 < _g2) {
				var i2 = _g11++;
				str1 += (i2 > 0 ? "," : "") + js_Boot.__string_rec(o[i2],s);
			}
			str1 += "]";
			return str1;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") {
				return s2;
			}
		}
		var k = null;
		var str2 = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str2.length != 2) {
			str2 += ", \n";
		}
		str2 += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str2 += "\n" + s + "}";
		return str2;
	case "string":
		return o;
	default:
		return String(o);
	}
};
var firebase = require("firebase");
String.__name__ = true;
Array.__name__ = true;
MainFirebase.main();
})();
