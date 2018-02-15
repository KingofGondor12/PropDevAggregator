// React Components
import React, {Component} from 'react';
import PropTypes from 'prop-types';
import ScrollableAnchor from 'react-scrollable-anchor'
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
import WorldMap from './components/WorldMap';
// API/Axios
import {api} from './api/init';
// Lodash
import _ from 'lodash';
// Q1ClearTitle
import Q1ClearTitle from './images/Q1ClearTitle.png';

// Custom renderer for Search Bar
const resultRenderer = ({ name, image, url }) => {
  return (
    <div class="ui link items">
      <a class="item" href={url} target="_blank">
        <div class="ui huge image">
          <img src={image} alt=''/>
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
        <ScrollableAnchor id={"search"}>
          <Search
              input={{fluid: true}}
              size={'large'}
              loading={isLoading}
              onResultSelect={this.handleResultSelect}
              onSearchChange={this.handleSearchChange}
              open={false}
              results={results}
              value={value}
              placeholder='Search...'
              {...this.props}
            />
          </ScrollableAnchor>
        <br />
        { !loaded && <Loader active size={'large'}>Loading</Loader> }
        {
          results ? <CardGrid siteData={results} /> : <CardGrid siteData={siteData} />
        }

        <br />
        { loaded && <WorldMap config={this.config} /> }
        <br />
      </Container>
    </div>
    )
  }

  componentWillMount() {
    this.setState({
      loaded: false
    })
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

  handleMapObjectClick = ( event ) => {
    this.setState({
      isLoading: true,
      value: event.mapObject.title
    })

    setTimeout(() => {
      if (this.state.value.length < 1) return this.resetComponent()

      const re = new RegExp(_.escapeRegExp(this.state.value), 'i')
      const isMatch = result => re.test(result.name.concat(result.tag))

      this.setState({
        isLoading: false,
        results: _.filter(this.state.siteData, isMatch)
      })
    }, 500)
    window.scrollTo(0, 0)
  }


  handleSearchChange = (e, { value }) => {
    this.setState({
      isLoading: true, value
    })

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

  config = {
    "type": "map",
    "pathToImages": "http://www.amcharts.com/lib/3/images/",
    fontFamily: "Lobster",
    "addClassNames": true,
    "zoomOnDoubleClick": false,
    "dragMap": false,
    "defs": {
      "linearGradient": [
        {
        "id": "map_background",
          "stop": [{
            "offset": "0%",
            "stop-color": "#3d599d"
          },{
            "offset": "100%",
            "stop-color": "#e9ebf2"
          }]
      },
      {
      "id": "country_gradient",
        "stop": [{
          "offset": "0%",
          "stop-color": "#ff4b7e"
        },{
          "offset": "50%",
          "stop-color": "#ff5a4b"
        },{
          "offset": "100%",
          "stop-color": "#ff9318"
        }],
      },
    ],
    },
    "fontSize": 15,
    "color": "#000",
    backgroundColor: "#7e7e7e",
    "projection": "miller",
    "backgroundAlpha": 0.9,
    "dataProvider": {
      "map": "worldLow",
      "getAreasFromMap": true
    },
    "balloon": {
      "color": "#000",
      "fontSize": 15,
      "fillAlpha": 1,
      "shadowAlpha": 0.25,
      "cornerRadius": 10,
      "adjustBorderColor": false,
      "pointerOrientation": "up"
    },
    "areasSettings": {
      "color": "#FFF",
      "outlineColor": 0,
      "rollOverOutlineColor": 0,
      "rollOverColor": "#1ccfab",
      "selectedColor": "#1cc8cf",
      "selectable": true,
      "autoZoom": false,
      "unlistedAreasAlpha": 0,
      "unlistedAreasOutlineAlpha": 0
    },
    "imagesSettings": {
      "alpha": 1,
      "color": 0,
      "outlineAlpha": 0,
      "rollOverOutlineAlpha": 0,
      "outlineColor": 0,
      "rollOverBrightness": 20,
      "selectedBrightness": 20,
      "selectable": true
    },
    "linesSettings": {
      "color": 0,
      "selectable": true,
      "rollOverBrightness": 20,
      "selectedBrightness": 20
    },
    "zoomControl": {
      "zoomControlEnabled": false,
      "homeButtonEnabled": false,
      "panControlEnabled": false,
    },
    "listeners": [{
      "event": "clickMapObject",
      "method": this.handleMapObjectClick
    }]
  }

}

export default App;
