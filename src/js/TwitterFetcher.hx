package externs;



/**
 * How to use fetch function:
 * @param {string} Your Twitter widget ID.
 * @param {string} The ID of the DOM element you want to write results to. 
 * @param {int} Optional - the maximum number of tweets you want returned. Must
 *     be a number between 1 and 20.
 * @param {boolean} Optional - set true if you want urls and hash
       tags to be hyperlinked!
 * @param {boolean} Optional - Set false if you dont want user photo /
 *     name for tweet to show.
 * @param {boolean} Optional - Set false if you dont want time of tweet
 *     to show.
 * @param {function/string} Optional - A function you can specify to format
 *     tweet date/time however you like. This function takes a JavaScript date
 *     as a parameter and returns a String representation of that date.
 *     Alternatively you may specify the string 'default' to leave it with
 *     Twitter's default renderings.
 * @param {boolean} Optional - Show retweets or not. Set false to not show.
 * @param {function/string} Optional - A function to call when data is ready. It
 *     also passes the data to this function should you wish to manipulate it
 *     yourself before outputting. If you specify this parameter you  must
 *     output data yourself!
 * @param {boolean} Optional - Show links for reply, retweet, favourite. Set false to not show.
 */
extern class TwitterFetcher {
    // public function new():Void;
    // 
    /**
     * @source
     * 			http://jasonmayes.com/projects/twitterApi/#sthash.UovplXQD.dpbs
     *    		http://codepen.io/jasonmayes/pen/Ioype?editors=001
     * @param  widgetID     [description]
     * @param  elID         [description]
     * @param  ?maxTweets   [description]
     * @param  ?hyperLink   [description]
     * @param  ?userInfo    [description]
     * @param  ?time        [description]
     * @param  ?timeFunc    [description]
     * @param  ?showRetweet [description]
     * @param  ?onDataReady [description]
     * @param  ?isReply     [description]
     * @return              [description]
     */
    public static function fetch(widgetID:String, elID:String, ?maxTweets:Int, ?hyperLink:Bool, ?userInfo:Bool, ?time:Bool, ?timeFunc:Dynamic, ?showRetweet:Bool, ?onDataReady:Dynamic, ?isReply:Bool):Void
    {
    	untyped __js__("twitterFetcher.fetch", widgetID, elID, maxTweets, hyperlink, userInfo, time, timeFunc, showRetweet, onDataReady, isReply );
    };
}