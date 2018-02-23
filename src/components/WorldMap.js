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
                  "stop-color": "#D0D7E9"
                }]
              }
            ]
          },
					"fontSize": 15,
					"color": "#000",
          backgroundColor: "#7e7e7e",
					"projection": "miller",
          "backgroundAlpha": 0.9,
					"dataProvider": {
						"map": "worldLow",
						"getAreasFromMap": true,
            "images": [
          							{
                          id: "AE",
                          customData: "Dubai",
                          color: "#1cc8cf",
                          url: "#search",
                          title: "<a href='#search'><div class='mapPoppup'><h2>Dubai & UAE</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>",
          								"longitude": 55.297222,
          								"latitude": 25.263056,
          								"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
          								"scale": 1
          							}
          						],
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
                  customData: "Dubai",
                  color: "#1cc8cf",
                  url: "#search",
                  title: "<a href='#search'><div class='mapPoppup'><h2>Dubai & UAE</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>"
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
