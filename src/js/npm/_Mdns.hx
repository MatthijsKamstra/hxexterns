package js.npm;


/**
		var browser = mdns.createBrowser(mdns.tcp('googlecast'));

		browser.on('serviceUp', function(service) {
		  trace('found device "%s" at %s:%d', service.name, service.addresses[0], service.port);
		  ondeviceup(service.addresses[0]);
		  browser.stop();
		});

		browser.start();
 */


extern class Mdns
implements npm.Package.Require<"mdns","">
{
	public function new ();

	public function createBrowser(arguments:Dynamic):Dynamic;

	public function tcp(arguments:String):Dynamic;
}