import js.Node.*;
import js.Node;
import js.Node.console;

import js.node.Fs;
import js.node.Path;

import node.Canvas;

class MainNodeCanvas {

	public function new() {
		init0();
		init1();
		init2();
	}

	// create svg
	function init0() {
		var canvas = new Canvas(400, 200, 'svg');
		var ctx = canvas.getContext2d();

		var y = 80;
		var x = 50;

		ctx.font = '22px Helvetica';
		ctx.fillText('node-canvas SVG', x, y);

		ctx.font = '10px Arial';
		ctx.fillText('Just a quick example of SVGs with node-canvas', x, (y += 20));

		ctx.globalAlpha = 0.5;
		ctx.fillRect(x, (y += 20), 10, 10);
		ctx.fillRect((x += 20), y, 10, 10);
		ctx.fillRect((x += 20), y, 10, 10);

		Fs.writeFile('out.svg', untyped canvas.toBuffer(), function (err) {
			if (err != null) throw err;

			console.log('created out.svg');
		});
	}

	// create pdf
	function init1() {

		var canvas = new Canvas(500, 500, 'pdf');
		var ctx = canvas.getContext2d();

		var x;
		var y;

		function reset () {
			x = 50;
			y = 80;
		}

		function h1 (str) {
			ctx.font = '22px Helvetica';
			ctx.fillText(str, x, y);
		}

		function p (str) {
			ctx.font = '10px Arial';
			ctx.fillText(str, x, (y += 20));
		}

		reset();
		h1('PDF demo');
		p('Multi-page PDF demonstration');
		untyped ctx.addPage();

		reset();
		h1('Page #2');
		p('This is the second page');
		untyped ctx.addPage();

		reset();
		h1('Page #3');
		p('This is the third page');

		Fs.writeFile('out.pdf', untyped canvas.toBuffer(), function (err) {
			if (err != null) throw err;

			console.log('created out.pdf');
		});
	}

	// create image
	function init2() {
		console.log('created image');

		// var Image = Canvas.Image;
		var canvas = new Canvas(200, 200);
		var ctx = canvas.getContext('2d');

		ctx.fillRect(0, 0, 150, 150);
		ctx.save();

		ctx.fillStyle = '#09F';
		ctx.fillRect(15, 15, 120, 120);

		ctx.save();
		ctx.fillStyle = '#FFF';
		ctx.globalAlpha = 0.5;
		ctx.fillRect(30, 30, 90, 90);

		ctx.restore();
		ctx.fillRect(45, 45, 60, 60);

		ctx.restore();
		ctx.fillRect(60, 60, 30, 30);

		var img = new Image();
		img.src = canvas.toBuffer();
		ctx.drawImage(img, 0, 0, 50, 50);
		ctx.drawImage(img, 50, 0, 50, 50);
		ctx.drawImage(img, 100, 0, 50, 50);

		// trace(Path.join(Node.__dirname, 'images', 'squid.png'));

		img = new Image();
		img.src = Fs.readFileSync(Path.join(Node.__dirname, 'images', 'squid.png'));
		ctx.drawImage(img, 30, 50, Math.round(img.width / 4), Math.round(img.height / 4));

		canvas.createPNGStream().pipe(Fs.createWriteStream(Path.join(Node.__dirname, 'out.png')));
	}

	static public function main() {
		var app = new MainNodeCanvas();
	}
}