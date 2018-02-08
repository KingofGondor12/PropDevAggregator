// React Components
import React, {Component} from 'react';
import PropTypes from 'prop-types';

// Semantic.ui React Components
import {Container, Segment, Search, Label, Image} from 'semantic-ui-react'
// Stylesheets
import './App.css';
// Child Components
import CardGrid from './components/CardGrid'
// API/Axios
import {api} from './api/init';
// Lodash
import _ from 'lodash'

const resultRenderer = ({ name, image, url }) => {
  return (
    <div><a href={url}>
      <Image src={image} />
      <Label content={name} />
      </a>
    </div>
  )
}

  resultRenderer.propTypes = {
    name: PropTypes.string,
    image: PropTypes.string,
    url: PropTypes.string
  }

class App extends Component {

state = {
  siteData: [],
  isLoading: false,
  value: "",
  results: []
}

render() {

  // Destructuring props to be passed into components
  const {siteData, isLoading, value, results } = this.state

  return (
    <div>
      <Segment className="AggHeader" inverted color='black' textAlign='center' size='massive'>
        Q1 Design PropDev Aggrigator
      </Segment>
        <Container>
          <Search
              input={{fluid: true}}
              size={'huge'}
              loading={isLoading}
              onResultSelect={this.handleResultSelect}
              onSearchChange={this.handleSearchChange}
              resultRenderer={resultRenderer}
              results={results}
              value={value}
              placeholder='Search...'
              {...this.props}
            />
             <br />
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

  resetComponent = () => this.setState({ isLoading: false, results: [], value: '' })

  handleResultSelect = (e, { result }) => this.setState({ value: result.title })

  handleSearchChange = (e, { value }) => {
    this.setState({ isLoading: true, value },
  )

    setTimeout(() => {
      if (this.state.value.length < 1) return this.resetComponent()

      const re = new RegExp(_.escapeRegExp(this.state.value), 'i')
      const isMatch = result => re.test(result.title)

      this.setState({
        isLoading: false,
        results: _.filter(this.state.siteData, isMatch)
      })
    }, 500)
  }
}

export default App;
