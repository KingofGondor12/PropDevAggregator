// React Components
import React, {Component} from 'react';
import PropTypes from 'prop-types';
// Semantic.ui React Components
import {
        Container,
        Search,
        Label,
        Image,
        Loader
      } from 'semantic-ui-react';
// Stylesheets
import './App.css';
// Child Components
import CardGrid from './components/CardGrid';
import WorldMap2 from './components/WorldMap2';
// API/Axios
import {api} from './api/init';
// Lodash
import _ from 'lodash';
// Q1ClearTitle
import Q1ClearTitle from './images/Q1ClearTitle2.png';

// Custom renderer for Search Bar
const resultRenderer = ({ name, image, url }) => {
  return (
    <div class="ui link items">
      <a class="item" href={url} target="_blank">
        <div class="ui huge image">
          <img src={image} />
        </div>
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
  value: '',
  results: [],
  loaded: null
}

render() {

  // Destructuring props to be passed into components
  const {siteData, isLoading, value, results, loaded } = this.state

  return (
    <div>
      <Container>
        <Image className='Q1Title' centered src={Q1ClearTitle} />
        <Search
            input={{fluid: true}}
            size={'large'}
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
        { !loaded && <Loader active size={'large'}>Loading</Loader> }
      <CardGrid siteData={siteData} />
        <br />
        {/* { loaded && <WorldMap className='WorldMap' /> } */}
        { loaded && <WorldMap2 /> }
        <br />
      </Container>
    </div>
    )
  }

  componentWillMount() {
    this.setState({loaded: false})
    // Grab out messages from the API
    api.get('/').then((response) => {
      // Everything worked, response.data is our array of messages
      this.setState({siteData: response.data, loaded: true})
      console.log('This is our state:', this.state.siteData)
    }).catch(function(error) {
      // Something went wrong
      console.warn(error);
    });
    this.resetComponent()
  }

  resetComponent = () => {
    this.setState({
      isLoading: false,
      results: [],
      value: ''
    })
  }

  handleResultSelect = (e, { result }) => {
    this.setState({
      value: result.name
    })
    console.log(result)
  }

  handleSearchChange = (e, { value }) => {
    this.setState({
      isLoading: true, value
    }
  )

    setTimeout(() => {
      if (this.state.value.length < 1) return this.resetComponent()

      const re = new RegExp(_.escapeRegExp(this.state.value), 'i')
      const isMatch = result => re.test(result.name.concat(result.tag))

      this.setState({
        isLoading: false,
        results: _.filter(this.state.siteData, isMatch)
      })
    }, 500)
  }
}

export default App;
