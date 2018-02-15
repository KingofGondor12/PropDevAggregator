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
        Loader,
        Button
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
import Q1ClearTitleColor from './images/Q1ClearTitleColor.png';
import Q1WorldTitle from './images/Q1WorldTitle.png';

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
        <ScrollableAnchor id="title">
          <Image className='Q1Title' centered src={Q1ClearTitleColor} />
        </ScrollableAnchor>
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
            <Button href="#Q1Map">WorldMap</Button>
        <br />
        { !loaded && <Loader active size={'large'}>Loading</Loader> }
      <CardGrid siteData={siteData} />
        { loaded &&
          <div>
            <Image id='Q1Map' centered src={Q1WorldTitle} />
            <WorldMap config={this.config} />
          </div> }
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
  }

  handleMapObjectClick = ( event ) => {
    this.setState({
      isLoading: true,
      value: event.mapObject.customData
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
      "getAreasFromMap": true,
      "images": [
                  {
                    id: "AE",
                    customData: "Dubai",
                    "autoZoom": true,
                    color: "#1cc8cf",
                    url: "#search",
                    title: "<a href='#search'><div class='AE_Map_Info'><h2>Dubai & UAE</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>",
                    "longitude": 55.297222,
                    "latitude": 25.263056,
                    "svgPath": "M3.5,13.277C3.5,6.22,9.22,0.5,16.276,0.5C23.333,0.5,29.053,6.22,29.053,13.277C29.053,14.54,28.867,15.759,28.526,16.914C26.707,24.271,16.219,32.5,16.219,32.5C16.219,32.5,4.37,23.209,3.673,15.542C3.673,15.542,3.704,15.536,3.704,15.536C3.572,14.804,3.5,14.049,3.5,13.277C3.5,13.277,3.5,13.277,3.5,13.277M16.102,16.123C18.989,16.123,21.329,13.782,21.329,10.895C21.329,8.008,18.989,5.668,16.102,5.668C13.216,5.668,10.876,8.008,10.876,10.895C10.876,13.782,13.216,16.123,16.102,16.123C16.102,16.123,16.102,16.123,16.102,16.123",
                    "scale": 1
                  }
                ],
      "areas":
        [
          {
            id: "AU",
            customData: "Australia",
            color: "#1cc8cf",
            url: "#search",
            title: "<a href='#search'><div class='AU_Map_Info'><h2>Australia</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>"
          },{
            id: "AE",
            customData: "Dubai",
            color: "#1cc8cf",
            url: "#search",
            title: "<a href='#search'><div class='AE_Map_Info'><h2>Dubai & UAE</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>"
          },{
            id: "CN",
            customData: "China",
            color: "#1cc8cf",
            url: "#search",
            title: "<a href='#search'><div class='CN_Map_Info'><h2>China</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>"
          },{
            id: "US",
            customData: "United States",
            color: "#1cc8cf",
            url: "#search",
            title: "<a href='#search'><div class='US_Map_Info'><h2>United States</h2><h4>Click to view all articles and resources related to this location.</h4></div></a>"
          }
        ]
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
