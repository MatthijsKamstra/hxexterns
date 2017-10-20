package api.chartjs;

class ChartDataVO {


	/**
	Property	Type	Usage
	data	Array<Number>	The data to plot in a line
	label	String	The label for the dataset which appears in the legend and tooltips
	fill	Boolean	If true, fill the area under the line
	lineTension	Number	Bezier curve tension of the line. Set to 0 to draw straightlines. Note This was renamed from 'tension' but the old name still works.
	backgroundColor	Color	The fill color under the line. See Colors
	borderWidth	Number	The width of the line in pixels
	borderColor	Color	The color of the line.
	borderCapStyle	String	Cap style of the line. See MDN
	borderDash	Array<Number>	Length and spacing of dashes. See MDN
	borderDashOffset	Number	Offset for line dashes. See MDN
	borderJoinStyle	String	Line joint style. See MDN
	pointBorderColor	Color or Array<Color>	The border color for points.
	pointBackgroundColor	Color or Array<Color>	The fill color for points
	pointBorderWidth	Number or Array<Number>	The width of the point border in pixels
	pointRadius	Number or Array<Number>	The radius of the point shape. If set to 0, nothing is rendered.
	pointHoverRadius	Number or Array<Number>	The radius of the point when hovered
	hitRadius	Number or Array<Number>	The pixel size of the non-displayed point that reacts to mouse events
	pointHoverBackgroundColor	Color or Array<Color>	Point background color when hovered
	pointHoverBorderColor	Color or Array<Color>	Point border color when hovered
	pointHoverBorderWidth	Number or Array<Number>	Border width of point when hovered
	pointStyle	String or Array<String>	The style of point. Options include 'circle', 'triangle', 'rect', 'rectRot', 'cross', 'crossRot', 'star', 'line', and 'dash'
	 */


	/*
	Chart Data
	To display data, the chart must be passed a data object that contains all of the information needed by the chart. The data object can contain the following parameters

	Name	Type	Description
	datasets	Array[object]	Contains data for each dataset. See the documentation for each chart type to determine the valid options that can be attached to the dataset
	labels	Array[string]	Optional parameter that is used with the category axis.
	xLabels	Array[string]	Optional parameter that is used with the category axis and is used if the axis is horizontal
	yLabels	Array[string]	Optional parameter that is used with the category axis and is used if the axis is vertical
	*/

	@:isVar public var datasets(get, set):ChartDataSet;
	function get_datasets():ChartDataSet {
		return dataset;
	}
	function set_datasets(value:ChartDataSet):ChartDataSet {
		return dataset = value;
	}

 	@:isVar public var labels(get, set):Array<String>;
 	function get_labels():Array<String> {
 		return labels;
 	}
 	function set_labels(value:Array<String>):Array<String> {
 		return labels = value;
 	}

	@:isVar public var xLabels(get, set):Array<String>;
	function get_xLabels():Array<String> {
		return xLabels;
	}
	function set_xLabels(value:Array<String>):Array<String> {
		return xLabels = value;
	}

	@:isVar public var yLabels(get, set):Array<String>;
	function get_yLabels():Array<String> {
		return yLabels;
	}
	function set_yLabels(value:Array<String>):Array<String> {
		return yLabels = value;
	}

	public function new() {

	}
}