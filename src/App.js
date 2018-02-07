// React Components
import React, {Component} from 'react';

// Semantic.ui React Components
import {
         Container,
         Segment
       }
       from 'semantic-ui-react'

// Stylesheets
import './App.css';

// Child Components
import CardGrid from './components/CardGrid'

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
    <div>
      <Container>
        <Segment inverted color='black' textAlign='center' size='massive'>Q1 Design PropDev Aggrigator</Segment>
        <CardGrid loading siteData={siteData} />
      </Container>
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
