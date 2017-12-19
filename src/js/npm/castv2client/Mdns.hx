package js.npm.castv2client;

import haxe.extern.EitherType;
import haxe.Constraints.Function;

typedef ServiceType = {
/**
 * { interfaceIndex: 4,
  type:
   ServiceType {
     name: 'googlecast',
     protocol: 'tcp',
     subtypes: [],
     fullyQualified: true },
  replyDomain: 'local.',
  flags: 2,
  name: 'Chromecast-10c9202216273171bda7522fc5d8cf52',
  networkInterface: 'en0',
  fullname: 'Chromecast-10c9202216273171bda7522fc5d8cf52._googlecast._tcp.local.',
  host: '10c92022-1627-3171-bda7-522fc5d8cf52.local.',
  port: 8009,
  rawTxtRecord: <Buffer 23 69 64 3d 31 30 63 39 32 30 32 32 31 36 32 37 33 31 37 31 62 64 61 37 35 32 32 66 63 35 64 38 63 66 35 32 23 63 64 3d 31 43 33 35 30 35 45 45 35 35 ... >,
  txtRecord:
   { id: '10c9202216273171bda7522fc5d8cf52',
     cd: '1C3505EE55BB7B5C976B50052EBCBC24',
     rm: '',
     ve: '05',
     md: 'Chromecast',
     ic: '/setup/icon.png',
     fn: '[mck] honey pot',
     ca: '4101',
     st: '0',
     bs: 'FA8FCA35E14C',
     nf: '1',
     rs: '' },
  addresses: [ '192.168.2.1' ] }
 */

	var name : String;
	var addresses : Array<String>;
	var port : String;


}

// @:native('Airtable')
@:jsRequire("mdns")
extern class Mdns {

	@:selfCall
	function new();
}


@:jsRequire("Browser")
extern class Browser {

		function on(type:String, callback: ServiceType -> Void):Void;

		function stop():Void;
		function start():Void;
}
