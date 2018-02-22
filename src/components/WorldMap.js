// React Components
import React, {Component} from 'react';
import AmCharts from "@amcharts/amcharts3-react";

class WorldMap extends Component {

  render() {
    var config = {
          "type": "map",
					"pathToImages": "http://www.amcharts.com/lib/3/images/",
          fontFamily: "Lobster",
					"addClassNames": true,
          "zoomOnDoubleClick": false,
          "defs": {
            "linearGradient": [
              {
              "id": "map_background",
                "stop": [{
                  "offset": "0%",
                  "stop-color": "#526ba8"
                  // "stop-color": "#64727d"

                },{
                  "offset": "100%",
                  "stop-color": "#e9ebf2"
                }]
            },
            {
            "id": "country_gradient",
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
					"color": "#000",
          backgroundColor: "#7e7e7e",
					"projection": "miller",
          "backgroundAlpha": 0.9,
					"dataProvider": {
						"map": "worldLow",
						"getAreasFromMap": true,
            "areas":
              [
                {
                  id: "AU",
                  customData: "Australia",
                  color: "#1cc8cf",
                  url: "#search",
                  title: "<a href='#search'><div class='mapPoppup'><h2>Australia</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>"
                },{
                  id: "AE",
                  customData: "United Arab Emirates",
                  color: "#1cc8cf",
                  url: "#search",
                  title: "<a href='#search'><div class='AE_Map_Info'><h2>United Arab Emirates</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>"
                },{
                  id: "CN",
                  customData: "China",
                  color: "#1cc8cf",
                  url: "#search",
                  title: "<a href='#search'><div class='mapPoppup'><h2>China</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>"
                },{
                  id: "US",
                  customData: "United States",
                  color: "#1cc8cf",
                  url: "#search",
                  title: "<a href='#search'><div class='mapPoppup'><h2>United States</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>"
                }
              ]
  				  },
            "balloon": {
              "color": "#606060",
              "fontSize": 15,
              "fillAlpha": 0.7,
              "shadowAlpha": 0.25,
              "cornerRadius": 10,
              "adjustBorderColor": false,
  					},
            "imagesSettings": {
  						"alpha": 1,
  						"color": "#000",
              "rollOverOutlineColor": "#000",
  						"rollOverOutlineAlpha": 0.2,
  						"outlineColor": 0,
  						"rollOverBrightness": 5,
  						"selectable": false,
              "selectedColor": "#1cc8cf",
              "autoZoom": false
  					},
  					"areasSettings": {
  						"color": "#FFF",
  						"outlineColor": 0,
              "selectedColor": "#1cc8cf",
  						"rollOverOutlineColor": "#000",
  						"rollOverOutlineAlpha": 0.5,
  						"rollOverBrightness": 5,
  						"selectable": false,
              "autoZoom": false,
  						"unlistedAreasAlpha": 0,
  						"unlistedAreasOutlineAlpha": 0
  					},
  					"zoomControl": {
  						"zoomControlEnabled": true,
  						"homeButtonEnabled": true,
  						"panControlEnabled": false,
  						"left": 38,
  						"bottom": 30,
  						"minZoomLevel": 0.75,
  						"maxZoomLevel": 5,
  						"buttonCornerRadius": 2
  					},
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
