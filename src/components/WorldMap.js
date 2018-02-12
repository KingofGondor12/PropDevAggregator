import React, { Component } from 'react';
import AmCharts from "@amcharts/amcharts3-react";

// Generate random data
function generateData() {
  var firstDate = new Date();

  var dataProvider = [];

  for (var i = 0; i < 100; ++i) {
    var date = new Date(firstDate.getTime());

    date.setDate(i);

    dataProvider.push({
      date: date,
      value: Math.floor(Math.random() * 100)
    });
  }

  return dataProvider;
}


// Component which contains the dynamic state for the chart
class WorldMap extends Component {
  constructor(props) {
    super(props);

    this.state = {
      dataProvider: {
        "map": "worldLow",
        "getAreasFromMap": true
      },
    };
  }

  componentWillUnmount() {
    clearInterval(this.state.timer);
  }

  render() {
    const config = {
      "type": "map",
      "theme": "light",
      "autoZoom": true,
      "selectedColor": "#CC0000",
      "dataProvider": this.state.dataProvider
    };

    return (
      <div className="App">
        <AmCharts.React style={{ width: "100%", height: "500px" }} options={config} />
      </div>
    );
  }
}

export default WorldMap;
