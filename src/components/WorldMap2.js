// React Components
import React, {Component} from 'react';
import AmCharts from "@amcharts/amcharts3-react";

class WorldMap2 extends Component {

  render() {

    var config = {
          "type": "map",
					"pathToImages": "http://www.amcharts.com/lib/3/images/",
					"addClassNames": true,
					"fontSize": 15,
					"color": "#FFFFFF",
					"projection": "miller",
					"backgroundAlpha": 0.1,
					"backgroundColor": "rgb(228, 228, 228)",
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
								"longitude": 134.1073,
								"latitude": -23.4038,
								"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
								"color": "rgba(75,216,181,1)",
								"scale": 1,
                title: "<strong>Australia</strong>",
                description: "<img src='http://upload.wikimedia.org/wikipedia/commons/9/97/Palace_of_Westminster%2C_London_-_Feb_2007.jpg', style='width:100px;height:100px;' /><p>London is the capital and most populous city of England and the United Kingdom. Standing on the River Thames, London has been a major settlement for two millennia, its history going back to its founding by the Romans, who named it Londinium. London's ancient core, the City of London, largely retains its 1.12-square-mile (2.9 km2) medieval boundaries and in 2011 had a resident population of 7,375, making it the smallest city in England. Since at least the 19th century, the term London has also referred to the metropolis developed around this core The bulk of this conurbation forms the Greater London administrative area (coterminous with the London region), governed by the Mayor of London and the London Assembly.</p>"
							},
							{
								"selectable": true,
								"title": "China",
								"longitude": 99.3043,
								"latitude": 37.7374,
								"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
								"color": "rgba(75,216,181,1)",
								"scale": 1,
                title: "<strong>Australia</strong>",
                description: "<img src='http://upload.wikimedia.org/wikipedia/commons/9/97/Palace_of_Westminster%2C_London_-_Feb_2007.jpg', style='width:100px;height:100px;' /><p>London is the capital and most populous city of England and the United Kingdom. Standing on the River Thames, London has been a major settlement for two millennia, its history going back to its founding by the Romans, who named it Londinium. London's ancient core, the City of London, largely retains its 1.12-square-mile (2.9 km2) medieval boundaries and in 2011 had a resident population of 7,375, making it the smallest city in England. Since at least the 19th century, the term London has also referred to the metropolis developed around this core The bulk of this conurbation forms the Greater London administrative area (coterminous with the London region), governed by the Mayor of London and the London Assembly.</p>"
							},
							{
								"selectable": true,
								"title": "United Arab Emirates",
								"longitude": 57.9347,
								"latitude": 20.8926,
								"svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
								"color": "rgba(75,216,181,1)",
								"scale": 1,
                title: "<strong>Australia</strong>",
                description: "<img src='http://upload.wikimedia.org/wikipedia/commons/9/97/Palace_of_Westminster%2C_London_-_Feb_2007.jpg', style='width:100px;height:100px;' /><p>London is the capital and most populous city of England and the United Kingdom. Standing on the River Thames, London has been a major settlement for two millennia, its history going back to its founding by the Romans, who named it Londinium. London's ancient core, the City of London, largely retains its 1.12-square-mile (2.9 km2) medieval boundaries and in 2011 had a resident population of 7,375, making it the smallest city in England. Since at least the 19th century, the term London has also referred to the metropolis developed around this core The bulk of this conurbation forms the Greater London administrative area (coterminous with the London region), governed by the Mayor of London and the London Assembly.</p>"
							}
						]
					},
          "balloon": {
						"horizontalPadding": 15,
						"borderAlpha": 0,
						"borderThickness": 1,
						"verticalPadding": 15
					},
					"areasSettings": {
						"color": "rgba(129,129,129,1)",
						"outlineColor": "rgba(80,80,80,0.1)",
						"rollOverOutlineColor": "rgba(80,80,80,0)",
						"rollOverColor": "rgba(150, 193, 182, 1)",
						"selectedColor": "rgba(75,216,181,1)",
						"selectable": true,
            "autoZoom": true,
						"unlistedAreasAlpha": 0,
						"unlistedAreasOutlineAlpha": 0
					},
					"imagesSettings": {
						"alpha": 1,
						"color": "rgba(129,129,129,1)",
						"outlineAlpha": 0,
						"rollOverOutlineAlpha": 0,
						"outlineColor": "rgba(80,80,80,1)",
						"rollOverBrightness": 20,
						"selectedBrightness": 20,
						"selectable": true
					},
					"linesSettings": {
						"color": "rgba(129,129,129,1)",
						"selectable": true,
						"rollOverBrightness": 20,
						"selectedBrightness": 20
					},
					"zoomControl": {
						"zoomControlEnabled": true,
						"homeButtonEnabled": true,
						"panControlEnabled": true,
						"right": 38,
						"bottom": 30,
						"minZoomLevel": 0.25,
						"gridHeight": 100,
						"gridAlpha": 0.1,
						"gridBackgroundAlpha": 0,
						"gridColor": "#FFFFFF",
						"draggerAlpha": 1,
						"buttonCornerRadius": 2
					}
    }

    return (
      <div>
        <AmCharts.React style={{ width: "100%", height: "500px" }} options={config} />
      </div>
    )
  }
}

export default WorldMap2;
