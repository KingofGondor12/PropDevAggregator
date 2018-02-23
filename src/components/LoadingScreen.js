// React Components
import React, {Component} from 'react';
// Semantic.ui React Components
import {
        Dimmer
       } from 'semantic-ui-react';

class LoadingScreen extends Component {

  render() {

    // Destructuring props to be passed into components
    // const {} = this.props

    return (
      <div>
        <Dimmer active>
          <div className="sk-folding-cube">
            <div className="sk-cube1 sk-cube"></div>
            <div className="sk-cube2 sk-cube"></div>
            <div className="sk-cube4 sk-cube"></div>
            <div className="sk-cube3 sk-cube"></div>
          </div>
          <h1 className="ml1">LOADING</h1>
        </Dimmer>
      </div>
    )
  }
}

export default LoadingScreen;
