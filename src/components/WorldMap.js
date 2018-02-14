// React Components
import React, {Component} from 'react';
import AmCharts from "@amcharts/amcharts3-react";

class WorldMap extends Component {

  render() {
    var config = {
          "type": "map",
					"pathToImages": "http://www.amcharts.com/lib/3/images/",
					"addClassNames": true,
          "defs": {
            "linearGradient": [
              {
              "id": "bg",
                "stop": [{
                  "offset": "0%",
                  "stop-color": "#2D7FBB"
                },{
                  "offset": "100%",
                  "stop-color": "#dbedff"
                }]
            },
            {
            "id": "sample2",
              "stop": [{
                "offset": "0%",
                "stop-color": "#0093ff"
              },{
                "offset": "100%",
                "stop-color": "#00950b"
              }]
            },
          ],
          },
					"fontSize": 15,
					"color": "#FFFFFF",
					"projection": "miller",
          "backgroundAlpha": 1,
					"dataProvider": {
						"map": "worldLow",
						"getAreasFromMap": true
					},
          "balloon": {
            "color": "#000",
            "fontSize": 15,
            "fillAlpha": 1,
            "shadowAlpha": 0.25,
            "cornerRadius": 10,
            "adjustBorderColor": false,
            "pointerOrientation": "up"
					},
					"areasSettings": {
						"color": "#FFF",
						"outlineColor": 0,
						"rollOverOutlineColor": 0,
						"rollOverColor": "#1ccfab",
						"selectedColor": "#1cc8cf",
						"selectable": true,
            "autoZoom": true,
						"unlistedAreasAlpha": 0,
						"unlistedAreasOutlineAlpha": 0
					},
					"imagesSettings": {
						"alpha": 1,
						"color": 0,
						"outlineAlpha": 0,
						"rollOverOutlineAlpha": 0,
						"outlineColor": 0,
						"rollOverBrightness": 20,
						"selectedBrightness": 20,
						"selectable": true
					},
					"linesSettings": {
						"color": 0,
						"selectable": true,
						"rollOverBrightness": 20,
						"selectedBrightness": 20
					},
					"zoomControl": {
						"zoomControlEnabled": true,
						"homeButtonEnabled": true,
						"panControlEnabled": false,
						"right": 38,
						"bottom": 30,
						"minZoomLevel": 0.5,
						"gridHeight": 100,
						"gridAlpha": 0.5,
						"gridBackgroundAlpha": 0,
						"gridColor": "#FFFFFF",
						"draggerAlpha": 1,
						"buttonCornerRadius": 2
					},
          "smallMap": {},
          "listeners": [{
            "event": "clickMapObject",
            "method": this.props.handleMapObjectClick
          }]
    }

    return (
      <div>
        <AmCharts.React style={{ width: "100%", height: "500px" }} options={config} />
      </div>
    )
  }
}

export default WorldMap;
