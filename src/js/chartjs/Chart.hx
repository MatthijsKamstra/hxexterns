package js.chartjs;

import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;

import haxe.extern.EitherType;

// import js.chartjs.AST;

@:enum
abstract ChartType(String) {
	var PIE = "pie";
	var LINE = "line";
	var BAR = "bar";
	var RADAR = "radar";
	var DOUGHNUT = "doughnut";
	var POLARAREA = "polarArea";
	var BUBBLE = "bubble";
}

/**
 * Haxe externs for Chart.js v2.8.0
 * Project: http://www.chartjs.org/
 * Definitions by: 	Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/MatthijsKamstra/hxexterns>
 */
#if nodejs
@:jsRequire("chart.js")
#end
@:native("Chart")
extern class Chart {

	static var readonly : Dynamic;
	var Chart : Dynamic;

	function new(context:EitherType<String, EitherType<CanvasRenderingContext2D, CanvasElement>>, config:ChartConfiguration):Void;


	var config : ChartConfiguration;
	var data : ChartData;
	var destroy : Void -> { };
	var update : ?Dynamic -> ?Dynamic -> { };
	var render : ?Dynamic -> ?Dynamic -> { };
	var stop : Void -> { };
	var resize : Void -> { };
	var clear : Void -> { };
	var toBase64Image : Void -> String;
	var generateLegend : Void -> { };
	var getElementAtEvent : Dynamic -> { };
	var getElementsAtEvent : Dynamic -> Array<{ }>;
	var getDatasetAtEvent : Dynamic -> Array<{ }>;
	// var getDatasetMeta : Float -> Meta;
	var ctx : haxe.extern.EitherType<CanvasRenderingContext2D, Dynamic>;
	var canvas : haxe.extern.EitherType<CanvasElement, Dynamic>;
	// var chartArea : ChartArea;

	// static var pluginService : PluginServiceStatic;
	// static var plugins : PluginServiceStatic;
	static var defaults : { var global : Dynamic; };
	static var controllers : { };
	static var helpers : { };
	// static var Tooltip : AST.ChartTooltipsStaticConfiguration;

}

typedef ChartConfiguration = {
	// @:optional
	// var type : haxe.extern.EitherType<String,ChartType>;
	var type : EitherType<String,ChartType>;
	@:optional
	var data : ChartData;
	@:optional
	var options : ChartOptions;
	// @:optional
	// var plugins : Array<PluginServiceRegistrationOptions>;
};

typedef ChartData = {
	@:optional
	var labels : Array<haxe.extern.EitherType<String, Array<String>>>;
	@:optional
	var datasets : Array<ChartDataSets>;
};

typedef ChartOptions = {
	@:optional
	var responsive : Bool;
	@:optional
	var responsiveAnimationDuration : Float;
	@:optional
	var aspectRatio : Float;
	@:optional
	var maintainAspectRatio : Bool;
	@:optional
	var events : Array<String>;
	// @:optional
	// // function onHover(_this:Chart, event:MouseEvent, activeElements:Array<{ }>):Dynamic;
	// @:optional
	// function onClick(?event:MouseEvent, ?activeElements:Array<{ }>):Dynamic;
	// @:optional
	// function onResize(_this:Chart, newSize:ChartSize):Void;
	@:optional var title : ChartTitleOptions;

	@:optional var legend : ChartLegendOptions;
	// @:optional
	// var tooltips : ChartTooltipOptions;
	// @:optional
	// var hover : ChartHoverOptions;
	// @:optional
	// var animation : ChartAnimationOptions;
	// @:optional
	// var elements : ChartElementsOptions;
	// @:optional
	// var layout : ChartLayoutOptions;
	@:optional
	var scales : EitherType<Dynamic, Int>; //ChartScales;
	@:optional
	var showLines : Bool;
	@:optional
	var spanGaps : Bool;
	@:optional
	var cutoutPercentage : Float;
	@:optional
	var circumference : Float;
	@:optional
	var rotation : Float;
	@:optional
	var devicePixelRatio : Float;
	@:optional
	var plugins : { };
};

// https://www.chartjs.org/docs/latest/configuration/title.html#title-configuration
typedef ChartTitleOptions = {
	// WIP
	@:optional var display : Bool;
	@:optional var text : EitherType<String,Array<String>>;
// 	display	boolean	false	Is the title shown?
// position	string	'top'	Position of title. more...
// fontSize	number	12	Font size.
// fontFamily	string	"'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"	Font family for the title text.
// fontColor	Color	'#666'	Font color.
// fontStyle	string	'bold'	Font style.
// padding	number	10	Number of pixels to add above and below the title text.
// lineHeight	number|string	1.2	Height of an individual line of text. See MDN.
// text	string|string[]	''	Title text to display. If specified as an array, text is rendered on multiple lines.
}


// https://www.chartjs.org/docs/latest/configuration/legend.html#configuration-options
typedef ChartLegendOptions = {
// display	boolean	true	Is the legend shown?
// position	string	'top'	Position of the legend. more...
// fullWidth	boolean	true	Marks that this box should take the full width of the canvas (pushing down other boxes). This is unlikely to need to be changed in day-to-day use.
// onClick	function		A callback that is called when a click event is registered on a label item.
// onHover	function		A callback that is called when a 'mousemove' event is registered on top of a label item.
// onLeave	function		A callback that is called when a 'mousemove' event is registered outside of a previously hovered label item.
// reverse	boolean	false	Legend will show datasets in reverse order.
// labels	object		See the Legend Label Configuration section below.

}


typedef ChartDataSets = {
	@:optional
	var cubicInterpolationMode : haxe.extern.EitherType<String, String>;
	@:optional
	var backgroundColor : haxe.extern.EitherType<ChartColor, Array<ChartColor>>;
	@:optional
	var borderWidth : haxe.extern.EitherType<Int, Array<Int>>;
	@:optional
	var borderColor : haxe.extern.EitherType<ChartColor, Array<ChartColor>>;
	@:optional
	var borderCapStyle : String;
	@:optional
	var borderDash : Array<Float>;
	@:optional
	var borderDashOffset : Float;
	@:optional
	var borderJoinStyle : String;
	// @:optional
	// var borderSkipped : PositionType;
	@:optional
	var data : haxe.extern.EitherType<Array<Float>, EitherType<Array<Int>, EitherType<Array<Dynamic>, Array<ChartPoint>>>>;
	@:optional
	var fill : haxe.extern.EitherType<Bool, haxe.extern.EitherType<Float, String>>;
	@:optional
	var hoverBackgroundColor : haxe.extern.EitherType<String, Array<String>>;
	@:optional
	var hoverBorderColor : haxe.extern.EitherType<String, Array<String>>;
	@:optional
	var hoverBorderWidth : haxe.extern.EitherType<Float, Array<Float>>;
	@:optional
	var label : String;
	@:optional
	var lineTension : Float;
	@:optional
	var steppedLine : haxe.extern.EitherType<String, haxe.extern.EitherType<String, Bool>>;
	@:optional
	var pointBorderColor : haxe.extern.EitherType<ChartColor, Array<ChartColor>>;
	@:optional
	var pointBackgroundColor : haxe.extern.EitherType<ChartColor, Array<ChartColor>>;
	@:optional
	var pointBorderWidth : haxe.extern.EitherType<Float, Array<Float>>;
	@:optional
	var pointRadius : haxe.extern.EitherType<Float, Array<Float>>;
	@:optional
	var pointHoverRadius : haxe.extern.EitherType<Float, Array<Float>>;
	@:optional
	var pointHitRadius : haxe.extern.EitherType<Float, Array<Float>>;
	@:optional
	var pointHoverBackgroundColor : haxe.extern.EitherType<ChartColor, Array<ChartColor>>;
	@:optional
	var pointHoverBorderColor : haxe.extern.EitherType<ChartColor, Array<ChartColor>>;
	@:optional
	var pointHoverBorderWidth : haxe.extern.EitherType<Float, Array<Float>>;
	// @:optional
	// var pointStyle : haxe.extern.EitherType<PointStyle, haxe.extern.EitherType<js.html.Image, haxe.extern.EitherType<js.html.CanvasElement, Array<haxe.extern.EitherType<PointStyle, haxe.extern.EitherType<js.html.Image, js.html.CanvasElement>>>>>>;
	@:optional
	var xAxisID : String;
	@:optional
	var yAxisID : String;
	@:optional
	var type : String;
	@:optional
	var hidden : Bool;
	@:optional
	var hideInLegendAndTooltip : Bool;
	@:optional
	var showLine : Bool;
	@:optional
	var stack : String;
	@:optional
	var spanGaps : Bool;
};

typedef ChartPoint = {
	@:optional
	var x : haxe.extern.EitherType<Float, haxe.extern.EitherType<Int, haxe.extern.EitherType<String, Date>>>;
	@:optional
	var y : haxe.extern.EitherType<Float, haxe.extern.EitherType<Int, haxe.extern.EitherType<String, Date>>>;
	@:optional
	var r :  haxe.extern.EitherType<Float, Int>;
	@:optional
	var t : haxe.extern.EitherType<Float, haxe.extern.EitherType<String, Date>>;
};

// typedef ChartScales = {
// 	@:optional
// 	var type : haxe.extern.EitherType<ScaleType, String>;
// 	@:optional
// 	var display : Bool;
// 	@:optional
// 	var position : haxe.extern.EitherType<PositionType, String>;
// 	@:optional
// 	var gridLines : GridLineOptions;
// 	@:optional
// 	var scaleLabel : ScaleTitleOptions;
// 	@:optional
// 	var ticks : TickOptions;
// 	@:optional
// 	var xAxes : Array<ChartXAxe>;
// 	@:optional
// 	var yAxes : Array<ChartYAxe>;
// };

typedef ChartColor = {} //enum