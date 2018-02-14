// React Components
import React, {Component} from 'react';
import AmCharts from "@amcharts/amcharts3-react";

class WorldMap extends Component {

  render() {
    var currentObject;
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
                  "stop-color": "#327ede"
                },{
                  "offset": "25%",
                  "stop-color": "#5795e3"
                },{
                  "offset": "100%",
                  "stop-color": "#d7e9ff"
                }]
            },
            {
            "id": "sample2",
              "stop": [{
                "offset": "0%",
                "stop-color": "#ff4b7e"
              },{
                "offset": "50%",
                "stop-color": "#ff5a4b"
              },{
                "offset": "100%",
                "stop-color": "#ff9318"
              }],
            },
          ],
          },
					"fontSize": 15,
					"color": "#FFFFFF",
					"projection": "miller",
          "backgroundAlpha": 0.9,
					"dataProvider": {
						"map": "worldLow",
						"getAreasFromMap": true,
            "areas":
              [
                {
                  id: "AU",
                  color: "#F37B86",
                  url: "#search",
                  title: "<a href='#search'><div class='sydDesc'><h1>Australia</h1><h3>Click to view all articles and resources related to this location.</h3></div></a>"
                },{
                  id: "AE",
                  color: "#FEE7A5",
                  url: "#search",
                  title: "<a href='#search'><div class='dubaiDesc'><h1>Dubai & UAE</h1><h3>Click to view all articles and resources related to this location.</h3></div></a>"
                },{
                  id: "CN",
                  color: "#3FA4E6",
                  url: "#search",
                  title: "<a href='#search'><div class='beijingDesc'><h1>China</h1><h3>Click to view all articles and resources related to this location.</h3></div></a>"
                },{
                  id: "US",
                  color: "#27358E",
                  url: "#search",
                  title: "<a href='#search'><div class='usaDesc'><h1>United States</h1><h3>Click to view all articles and resources related to this location.</h3></div></a>"
                }
              ],
						// "images": [
						// 	{
						// 		"top": 40,
						// 		"left": 60,
						// 		"width": 80,
						// 		"height": 40,
						// 	},
            //   {
						// 		"selectable": true,
            //     title: "<a href='#search'><div class='sydDesc'><h1>Australia</h1><h3>Click to view all articles and resources related to this location.</h3></div></a>",
						// 		"longitude": 151.209444,
						// 		"latitude": -33.865,
						// 		"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						// 		"color": "#ff6691",
						// 		"scale": 1,
            //     "myUrl": "#search"
						// 	},
						// 	{
						// 		"selectable": true,
            //     title: "<a href='#search'><div class='beijingDesc'><h1>China</h1><h3>Click to view all articles and resources related to this location.</h3></div></a>",
						// 		"longitude": 116.383333,
						// 		"latitude": 39.916667,
						// 		"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						// 		"color": "rgba(255, 102, 145, 1)",
						// 		"scale": 1,
            //     "myUrl": "#search"
						// 	},
						// 	{
						// 		"selectable": true,
            //     title: "<a href='#search'><div class='dubaiDesc'><h1>Dubai & UAE</h1><h3>Click to view all articles and resources related to this location.</h3></div></a>",
						// 		"longitude": 55.297222,
						// 		"latitude": 25.263056,
						// 		"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
						// 		"color": "rgba(255, 102, 145, 1)",
						// 		"scale": 1,
            //     "myUrl": "#search"
						// 	}
						// ]
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
						// "rollOverColor": "#1ccfab",
						"selectedColor": "#1cc8cf",
						"selectable": false,
            "autoZoom": false,
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
						"gridColor": "#FFF",
						"draggerAlpha": 1,
						"buttonCornerRadius": 2
					},
          "smallMap": {},
          // "listeners": [ {
          //   "event": "clickMapObject",
          //   "method": function( event ) {
          //       window.location.href = event.mapObject.myUrl;
          //   }
          // }]
    }

    function clickObject( id ) {
      config.clickMapObject( config.getObjectById( id ) );
    }

    return (
      <div>
        <AmCharts.React style={{ width: "100%", height: "500px" }} options={config} />
      </div>
    )
  }
}

export default WorldMap;
