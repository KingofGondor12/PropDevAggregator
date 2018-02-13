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
            "linearGradient": {
              "id": "sample",
                "stop": [{
                  "offset": "0%",
                  "stop-color": "#2D7FBB"
                },{
                  "offset": "100%",
                  "stop-color": "#abdbff"
                }]
            }
          },
					"fontSize": 15,
					"color": "#FFFFFF",
					"projection": "miller",
          "backgroundAlpha": 1,
					"dataProvider": {
						"map": "worldLow",
						"getAreasFromMap": true,
						"images": [
							{
								"top": 40,
								"left": 60,
								"width": 80,
								"height": 40,
							},
              {
								"selectable": true,
								"title": "Australia",
								"longitude": 151.209444,
								"latitude": -33.865,
								"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
								"color": "rgba(255, 113, 113, 1)",
								"scale": 1,
                title: "<div class='centered'><h2>Sydney</h2></div>",
                description: "<a href='#search'><div class='sydDesc'><h3>Click to view all articles and resources related to this location.</h3></div></a>"
							},
							{
								"selectable": true,
								"title": "China",
								"longitude": 116.383333,
								"latitude": 39.916667,
								"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
								"color": "rgba(255, 113, 113, 1)",
								"scale": 1,
                title: "<div class='centered'><h2>Beijing</h2></div>",
                description: "<a href='#search'><div class='beijingDesc'><h3>Click to view all articles and resources related to this location.</h3></div></a>"
							},
							{
								"selectable": true,
								"title": "United Arab Emirates",
								"longitude": 55.297222,
								"latitude": 25.263056,
								"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
								"color": "rgba(255, 113, 113, 1)",
								"scale": 1,
                title: "<div class='centered'><h2>Dubai</h2></div>",
                description: "<a href='#search'><div class='dubaiDesc'><h3>Click to view all articles and resources related to this location.</h3></div></a>"
							}
						]
					},
          "balloon": {
            "fontSize": 15,
            "fillAlpha": 1,
            "shadowAlpha": 0,
            "cornerRadius": 5,
            "color": "#FFF",
            "fillColor": "#333",
            "adjustBorderColor": true,
            "borderColor": "#333"
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
						"gridAlpha": 0.1,
						"gridBackgroundAlpha": 0,
						"gridColor": "#FFFFFF",
						"draggerAlpha": 1,
						"buttonCornerRadius": 2
					},
          "smallMap": {}
    }

    return (
      <div>
        <AmCharts.React style={{ width: "100%", height: "500px" }} options={config} />
      </div>
    )
  }
}

export default WorldMap;
