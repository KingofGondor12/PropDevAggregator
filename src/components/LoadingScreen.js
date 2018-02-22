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
          <div class="sk-folding-cube">
            <div class="sk-cube1 sk-cube"></div>
            <div class="sk-cube2 sk-cube"></div>
            <div class="sk-cube4 sk-cube"></div>
            <div class="sk-cube3 sk-cube"></div>
          </div>
          <h1 class="ml1">LOADING</h1>
          {/* <Loader indeterminate size={'large'}>Just a few seconds...</Loader> */}
        </Dimmer>
      </div>
    )
  }
}

export default LoadingScreen;
