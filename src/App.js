// React Components
import React, {Component} from 'react';
// Semantic.ui React Components
import {Container, Segment, Search} from 'semantic-ui-react'
// Stylesheets
import './App.css';
// Child Components
import CardGrid from './components/CardGrid'
// API/Axios
import {api} from './api/init';
// Lodash
import _ from 'lodash'


class App extends Component {

state = {
  siteData: []
}

resetComponent = () => this.setState({ isLoading: false, results: [], value: '' })

handleResultSelect = (e, { result }) => this.setState({ value: result.title })

handleSearchChange = (e, { value }) => {
  this.setState({ isLoading: true, value })

  setTimeout(() => {
    if (this.state.value.length < 1) return this.resetComponent()

    const re = new RegExp(_.escapeRegExp(this.state.value), 'i')
    const isMatch = result => re.test(result.name)

    this.setState({
      isLoading: false,
      results: _.filter(this.state.siteData, isMatch),
    })
  }, 500)
}

render() {

  // Destructuring props to be passed into components
  const {siteData, isLoading, value, results } = this.state

  return (
    <div>
      <Container>
        <Segment inverted color='black' textAlign='center' size='massive'>
          Q1 Design PropDev Aggrigator
          </Segment>
          <Search
              loading={isLoading}
              onResultSelect={this.handleResultSelect}
              onSearchChange={this.handleSearchChange}
              results={results}
              value={value}
              {...this.props}
            />
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
    this.resetComponent()
  }
}

export default App;
