=========

Externs of Chart.js for Haxe - Simple, clean and engaging charts for designers and developers



```
/**
 * Haxe externs for Chart.js v2.7.2
 * Project: http://www.chartjs.org/
 * Definitions by: 	Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/MatthijsKamstra/hxexterns>
 */
```

### Usage ###

```haxe

import js.chart.defaults.Global;
import js.chart.Chart;

import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;
import js.Browser;

class Main {

	var data = {
		labels: ["January", "February", "March", "April", "May", "June", "July"],
		datasets: [
			{
				label: "My First dataset",
				fillColor: "rgba(220,220,220,0.5)",
				strokeColor: "rgba(220,220,220,0.8)",
				highlightFill: "rgba(220,220,220,0.75)",
				highlightStroke: "rgba(220,220,220,1)",
				data: [65, 59, 80, 81, 56, 55, 40]
			},
			{
				label: "My Second dataset",
				fillColor: "rgba(151,187,205,0.5)",
				strokeColor: "rgba(151,187,205,0.8)",
				highlightFill: "rgba(151,187,205,0.75)",
				highlightStroke: "rgba(151,187,205,1)",
				data: [28, 48, 40, 19, 86, 27, 90]
			}
		]
	};

	public function new() {
		var canvas:CanvasElement = Browser.document.createCanvasElement();
		Browser.document.body.appendChild(canvas);

		Global.responsive = true;

		var ctx:CanvasRenderingContext2D = canvas.getContext("2d");
		var barChart = new Chart(ctx).Bar(data);
	}

	static function main() {
		new Main();
	}
}
```

[Chart.js](https://github.com/nnnick/Chart.js) is written by [Nick Downie](http://www.nickdownie.com) and licensed under the [MIT](http://opensource.org/licenses/MIT) License.
