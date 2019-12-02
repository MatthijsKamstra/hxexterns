package;

import js.Browser.document;
import js.Browser.*;
import js.test.tone.Tone;
import js.test.tone.instrument.Synth;

class MainTone {
	public function new() {
		window.addEventListener('DOMContentLoaded', init);
	}

	function init() {
		init1();
	}

	function init1() {
		// create a synth and connect it to the master output (your speakers)
		// var synth = Tone.construct().Synth(); // .toMaster();
		// var synth = new Tone();
		//

		// play a middle 'C' for the duration of an 8th note
		// synth.triggerAttackRelease("C4", "8n");

		// create a synth and connect it to the master output (your speakers)
		var synth = new Synth().toMaster();

		// play a middle 'C' for the duration of an 8th note
		synth.triggerAttackRelease("C4", "8n");
	}

	static public function main() {
		var app = new MainTone();
	}
}
