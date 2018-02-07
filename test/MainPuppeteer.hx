package;


import js.npm.Puppeteer;

import js.Browser.*;
import js.Browser.console;
import js.html.Window.*;
// import js.html.Window.setTimeout;

class MainPuppeteer {

	public function new() {


		// const puppeteer = require('puppeteer');
		var puppeteer = new Puppeteer();

		// A.sync(function (){
		// 	console.log('test 0');
		// });


		new Async(function (){
			var browser = puppeteer.launch().then();
		});
		// new Async(function (){
		// 	console.log('test 1');
		// 	var browser = new Await ( function (){
		// 		puppeteer.launch();
		// 	});

		// 	var page = puppeteer.await(); //browser.newPage();
		// 	// var browser = new Await (  puppeteer.launch() );
		//  	var pagez = AAwai.t();// browser.newPage();

		//  	var tt = AAwai.debug();

		//  	var a = A.wait( puppeteer.newPage() );


		// //   const page = await browser.newPage();
		// //   await page.goto('https://example.com');
		// //   await page.screenshot({path: 'example.png'});

		// //   await browser.close();
		// });

		// (async () => {
		//   const browser = await puppeteer.launch();
		//   const page = await browser.newPage();
		//   await page.goto('https://example.com');
		//   await page.screenshot({path: 'example.png'});

		//   await browser.close();
		// })();

	}

	static public function main() {
		var app = new MainPuppeteer();
	}
}