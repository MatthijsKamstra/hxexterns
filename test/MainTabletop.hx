package;

import js.Browser.document;
import js.Browser.*;

import js.Tabletop;

class MainTabletop {

	public function new() {
		window.addEventListener('DOMContentLoaded', init);
	}

	function init(){
		init1();
	}

	function init1(){
		Tabletop.init(
			{
				key: 'https://docs.google.com/spreadsheets/d/0AmYzu_s7QHsmdDNZUzRlYldnWTZCLXdrMXlYQzVxSFE/pubhtml',
				callback: function(data, tabletop) {
					console.log(data);
				},
				simpleSheet: true
			}
		 );
	}

	static public function main() {
		var app = new MainTabletop();
	}
}