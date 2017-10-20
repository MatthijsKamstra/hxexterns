package externs.twitter;

/**
haxe externs for
https://github.com/dg/twitter-php/
*/

/**
 * Twitter for PHP - library for sending messages to Twitter and receiving status updates.
 *
 * @author     David Grudl
 * @copyright  Copyright (c) 2008 David Grudl
 * @license    New BSD License
 * @link       http://phpfashion.com/
 * @see        http://dev.twitter.com/doc
 * @version    3.3
 */

extern class Twitter
{
	static inline public var ME : Int             = 1;
	static inline public var ME_AND_FRIENDS : Int = 2;
	static inline public var REPLIES : Int        = 3;
	static inline public var RETWEETS : Int       = 128; // include retweets?


	/**
	*	var _twitter:Twitter;
	* 	_twitter = new Twitter(AppConstants.CONSUMER_KEY, AppConstants.CONSUMER_SECRET, AppConstants.ACCESS_TOKEN, AppConstants.ACCESS_TOKEN_SECRET);
	* 	
	*	//var tt = _twitter.loadUserInfo("I_am_Grumm");
	*	//var tt = _twitter.loadUserFollowers("I_am_Grumm");	
	*
	*	try{
	*		// var tt = _twitter.loadUserInfo("I_am_Grumm");
	*		var tt = _twitter.loadUserFollowers("I_am_Grumm");
	*		trace( "Type.typeof(tt): " + Type.typeof(tt) );
	*		trace( "tt: " +  haxe.Json.stringify(tt));
	*	} catch (unknown : Dynamic ) {
  	*		trace("Unknown exception : " + Std.string(unknown));
	*	}
	*
	*/


    static function __init__():Void untyped {
        __call__("require_once", "twitter.class.php");
    }

	// $twitter = new Twitter($consumerKey, $consumerSecret, $accessToken, $accessTokenSecret);
	/**
	 * Creates object using consumer and access keys.
	 * @param	String 	consumer key
	 * @param	String  app secret
	 * @param	String  optional access token
	 * @param	String  optional access token secret
	 * @throws 	TwitterException when CURL extension is not loaded
	 */    
    public function new(pConsumerKey:String, pConsumerSecret:String, ?pAccessToken:String, ?pAccessTokenSecret:String):Void;
	
	// UNTESTED
	/**
	* 	if (!$twitter->authenticate()) {
    *		die('Invalid name or password');
	*	}
	*/
	/**
	 * Tests if user credentials are valid.
	 * @return boolean
	 * @throws TwitterException
	 */
	public function authenticate():Dynamic;

	// $twitter->send('I am fine today.');
	// $twitter->send('I am fine today.', 'filename.gif');
	/**
	 * Sends message to the Twitter.
	 *
	 * @example		_twitter.send('I am fine today.') ;
	 * 				_twitter.send('I am fine today.', sys.FileSystem.fullPath('filename.gif') ) ;
	 *
	 * @param String   message encoded in UTF-8
	 * @param String   optional image path (make sure its a local path)
	 * @return object
	 * @throws TwitterException
	 */
	public function send(pMessage:String, ?pMedia:String):Dynamic;
	// public function send(pMessage:String, ?pMedia:Array<String>):Dynamic;

	// UNTESTED
	/**
	 * Follows a user on Twitter.
	 * @param  String  user name
	 * @return object
	 * @throws TwitterException
	 */
	public function follow(pUsername:String):Dynamic;

	// $statuses = $twitter->load(Twitter::ME);
	// $statuses = $twitter->load(Twitter::ME_AND_FRIENDS);
	// $statuses = $twitter->load(Twitter::REPLIES);
	/**
	 * Returns the most recent statuses.
	 * @param  int    timeline (ME | ME_AND_FRIENDS | REPLIES) and optional (RETWEETS)
	 * @param  int    number of statuses to retrieve
	 * @param  int    page of results to retrieve
	 * @return mixed
	 * @throws TwitterException
	 */
	public function load(pFlags:Int = 1, pCcount:Int = 20, ?pArray:Array<Dynamic>):Dynamic;

	/**
	 * Returns information of a given user.
	 * @param  string name
	 * @return mixed
	 * @throws TwitterException
	 */
	public function loadUserInfo(pUser:String):Dynamic;	

	/**
	 * Returns information of a given user.
	 * @param  string name
	 * @return mixed
	 * @throws TwitterException
	 */
	public function loadUserInfoById(pId:Int):Dynamic;

	// $twitter->loadUserFollowers('I_am_grumm');
	/**
	* Returns followers of a given user.
	* @param string 	pUser --> screen_name
	* @param int 		pCount
	* @param int 		pCursor
	* @param int 		pCacheExpiry
	* @return mixed
	* @throws TwitterException
	*/
	public function loadUserFollowers(pUser:String, pCount:Int = 5000, pCursor:Int = -1, ?pCacheExpiry:Int):Dynamic;

	// untested
	/**
	 * Destroys status.
	 * @param  int    id of status to be destroyed
	 * @return mixed
	 * @throws TwitterException
	 */
	public function destroy(pId:String):Dynamic;

	// $results = $twitter->search('#nette');
	// or use hashmap: $results = $twitter->search(array('q' => '#nette', 'geocode' => '50.088224,15.975611,20km'));
	/**
	 * Returns tweets that match a specified query.
	 * @example		_twitter.search('papertoy') ;
	 * 				_twitter.search(['papertoy', 'robot'], true ) ;
	 * 				_twitter.search(StringTools.urlEncode("#papertoy"), true) ;
	 * 				???? Map? -> http://api.haxe.org//Map.html
	 * @param  	string|array   query
	 * @param  	bool  return complete response?
	 * @see 	https://dev.twitter.com/docs/api/1.1/get/search/tweets
	 * 			https://dev.twitter.com/docs/using-search
	 * @return 	mixed
	 * @throws 	TwitterException
	 */
	public function search(pQuery:Dynamic, pFull:Bool = false):Dynamic;

	// untested
	/**
	 * Process HTTP request.
	 * @param  string  URL or twitter command
	 * @param  string  HTTP method GET or POST
	 * @param  array   data
	 * @param  array   uploaded files
	 * @return mixed
	 * @throws TwitterException
	 */
	public function request(pResource:String, pMethod:String, ?pData:Array<Dynamic>, ?pFiles:Array<Dynamic>):Dynamic;
	
	// untested
	/**
	 * Makes twitter links, @usernames and #hashtags clickable.
	 * @param  stdClass|string status
	 * @return string
	 */
	public static function clickable(pStatus:String):String;

}
