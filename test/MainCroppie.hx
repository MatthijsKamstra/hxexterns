package;

import js.Croppie;

import js.Browser.console;
import js.Browser.document;
import js.Browser.*;



class MainCroppie {

	public function new() {
		init();
	}

	function init(){
		var el = document.getElementById('vanilla-demo');
		var obj : js.CroppyObject = {
			viewport: { width: 100, height: 100 },
			boundary: { width: 300, height: 300 },
			showZoomer: false,
			enableOrientation: true
		};
		var vanilla = new Croppie(el, obj);
		vanilla.bind({
			url: 'demo/demo-2.jpg',
			orientation: 4
		});
		el.addEventListener('update', function (ev) {
        	console.log('vanilla update', ev);
        });
		// on button click
		document.querySelector('.vanilla-result').addEventListener('click', function (ev) {
			vanilla.result('blob').then(function(blob) {
				// do something with cropped blob
				console.log('blob: ' + blob);
			});
		});
	}


	static public function main() {
		var app = new MainCroppie();
	}
}