package api.chartjs;

/**
 * Generated with HxJsonDef (version 0.0.3) on Wed Nov 16 2016 21:28:31 GMT+0100 (CET)
 * from : http://matthijskamstra.github.io/hxjsondef/#
 *
 * AST = Abstract Syntax Tree
 *
 * Note:
 * If you profide a .json there should be no null values
 * comments in this document show you the values that need to be changed!
 *
 * Some (backend)-developers choose to hide empty/null values, you can add them:
 * 		@:optional var _id : Int;
 *
 * Name(s) that you possibly need to change:
 * 		ChartJsObj
 * 		Data
 * 		Datasets
 * 		Options
 * 		Scales
 * 		YAxes
 * 		Ticks
 */

typedef ChartJsObj =
{
	var type : String;
	var data : Data;
	@:optional var options : Options;
};

typedef Data =
{
	var labels : Array<String>;
	var datasets : Array<Datasets>;
	/**
datasets	Array[object]	Contains data for each dataset. See the documentation for each chart type to determine the valid options that can be attached to the dataset
labels	Array[string]	Optional parameter that is used with the category axis.
xLabels	Array[string]	Optional parameter that is used with the category axis and is used if the axis is horizontal
yLabels	Array[string]	Optional parameter that is used with the category axis and is used if the axis is vertical
	 */
};

typedef Datasets =
{
	var data : Array<Int>;
	var label : String;
	var backgroundColor : String;
	var borderColor : String;
	var pointBackgroundColor : String;
	@:optional var borderWidth : Int;
	var pointBorderColor : String;
	var pointHoverBackgroundColor : String;
	var pointHoverBorderColor : String;



};

typedef Options =
{
	@:optional var scales : Scales;
	@:optional var scale : Scale;
	@:optional var startAngle : Float;
	@:optional var responsive : Bool;
	@:optional var animation : Bool;
	@:optional var width : Int;
	@:optional var height : Int;
	@:optional var legend : Legend;
};

typedef Legend = 
{
	@:optional var position : String;
}

typedef Scale = 
{
	@:optional var ticks : Ticks;
	@:optional var pointLabels : PointLabel;
}

typedef Scales =
{
	@:optional var yAxes : Array<YAxes>;
};

typedef YAxes =
{
	@:optional var ticks : Ticks;
};

typedef Ticks =
{
	@:optional var beginAtZero : Bool;
	@:optional var min : Float;
	@:optional var stepSize : Float; // if defined, it can be used along with the min and the max to give a custom number of steps. See the example below.
	@:optional var fontSize : Int;
	@:optional var showLabelBackdrop : Bool; // 	If true, draw a background behind the tick labels
};

typedef PointLabel = 
{
	@:optional var callback : Dynamic ; //	Function	-	Callback function to transform data label to axis label
	@:optional var fontColor : String ; //	Color	'#666'	Font color
	@:optional var fontFamily : String ; //	String	"'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"	Font family to render
	@:optional var fontSize	: Int ; //Number	10	Font size in pixels
	@:optional var fontStyle : String ; //	String	'normal'	Font Style to use
}
