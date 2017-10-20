package api.chartjs;

import api.chartjs.ChartDataVO;

class ChartVO {


	@:isVar public var type(get, set):String;
	function get_type():String {
		return type;
	}
	function set_type(value:String):String {
		return type = value;
	}

 	@:isVar public var data(get, set):Array<ChartDataVO>;
 	function get_data():Array<ChartDataVO> {
 		return data;
 	}
 	function set_data(value:Array<ChartDataVO>):Array<ChartDataVO> {
 		return data = value;
 	}


	public function new() {

	}
}