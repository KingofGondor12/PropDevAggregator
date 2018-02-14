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
					"zoomControl": {
						"zoomControlEnabled": true,
						"homeButtonEnabled": true,
						"panControlEnabled": false,
						"right": 38,
						"bottom": 30,
						"minZoomLevel": 0.75,
						"maxZoomLevel": 5,
						"gridHeight": 100,
						"gridAlpha": 1,
						"gridBackgroundAlpha": 0.1,
						"gridColor": "#FFF",
						"draggerAlpha": 1,
						"buttonCornerRadius": 2
					},
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
