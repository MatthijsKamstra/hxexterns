// Generated by Haxe 3.4.7
if (process.version < "v04.0.0") console.warn("Module " + (typeof(module) == "undefined" ? "" : module.filename) + " requires node.js version 4.0.0 or higher");
(function () { "use strict";
var MainFaker = function() {
	this.init0();
	this.init1();
	this.init2();
};
MainFaker.main = function() {
	var app = new MainFaker();
};
MainFaker.prototype = {
	init0: function() {
		var randomName = faker.name.findName();
		var randomEmail = faker.internet.email();
		var randomCard = faker.helpers.createCard();
	}
	,init1: function() {
		faker.seed(123);
		var firstRandom = faker.random.number();
		faker.seed(123);
		var secondRandom = faker.random.number();
		window.console.log(firstRandom == secondRandom);
	}
	,init2: function() {
		faker.setLocale("de");
		faker.setLocale("de");
		faker.locale = "nl";
		faker.locale = "nl";
	}
};
var faker = require("faker");
MainFaker.main();
})();
