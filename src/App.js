// React Components

import React, {Component} from 'react';

// Stylesheets
import './App.css';

// Child Components
import Grid from './components/Grid'

// API/Axios
import {api} from './api/init';

class App extends Component {

state = {
  siteData: []
}

render() {

  // Destructuring props to be passed into components
  const {siteData} = this.state

  return (
    <div className="ui container">
      <div className="ui doubling stackable four column grid">
          {siteData.map(() =>
            <Grid siteData={siteData} />
            )
          }
      </div>
    </div>
    )
  }

  componentWillMount() {
    // Grab out messages from the API
    api.get('/').then((response) => {
      // Everything worked, response.data is our array of messages
      this.setState({siteData: response.data})
      console.log('This is our state:', this.state.siteData)
    }).catch(function(error) {
      // Something went wrong
      console.warn(error);
    });
  }
}

export default App;
