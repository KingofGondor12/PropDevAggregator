// React Components
import React, {Component} from 'react';
import AmCharts from "@amcharts/amcharts3-react";

class WorldMap extends Component {

  render() {
    return (
      <div>
        <AmCharts.React style={{ width: "100%", height: "500px" }} options={this.props.config} />
      </div>
    )
  }
}

export default WorldMap;
