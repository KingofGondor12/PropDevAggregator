// React Components
import React, {Component} from 'react';
import ScrollableAnchor from 'react-scrollable-anchor';
import configureAnchors from 'react-scrollable-anchor';
// Semantic.ui React Components
import {
        Container,
        Search,
        Image,
        Button,
        Icon,
        Dimmer,
        Statistic,
        Segment,
        Transition
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
import Q1ClearTitleColor from './images/Q1ClearTitleColor.png';
import Q1WorldTitle from './images/Q1WorldTitle.png';

// Custom renderer for Search Bar
// const resultRenderer = ({ name, image, url, description }) => {
//   return (
//     <div class="ui link items">
//       <a class="item" href={url} target="_blank">
//         <div class="ui huge image">
//           <img src={image} />
//         </div>
//         <Label content={name} />
//       </a>
//     </div>
//   )
// }
//
//   resultRenderer.propTypes = {
//     name: PropTypes.string,
//     image: PropTypes.string,
//     description: PropTypes.string,
//     url: PropTypes.string
//   }

class App extends Component {

state = {
  siteData: [],
  isLoading: false,
  value: '',
  results: [],
  loaded: null,
  visible: null
}

render() {

  // Destructuring props to be passed into components
  const {siteData, isLoading, value, results, loaded, visible } = this.state

  return (
    <Container fluid >
      <Container>
  {/* Loading spinner */}
        { !loaded &&
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
        }
  {/* Anchor for clickable-map. Scrolls to top of page to search bar */}
        <ScrollableAnchor id={"search"}>
          <div>
          </div>
        </ScrollableAnchor>
  {/* Title image */}
          <Image centered src={Q1ClearTitleColor} />
  {/* Search bar */}
        <Search
          id={'searchbar'}
          input={{fluid: true}}
          size={'large'}
          loading={isLoading}
          onResultSelect={this.handleResultSelect}
          onSearchChange={this.handleSearchChange}
          results={results}
          open={false}
          value={value}
          placeholder='Search...'
          {...this.props}
        />
        <br />
        <div className="buttonMenu">
          <Button href="#map" animated={'fade'}>
            <Button.Content visible>Worldwide Developments</Button.Content>
            <Button.Content hidden>
              <Icon name='world' size='large' />
            </Button.Content>
          </Button>
          {/* <Button content={visible ? 'Hide' : 'Show'} onClick={this.toggleVisibility} /> */}
        </div>
        <br />
        <hr />
        <br />
  {/* Trasition code for CardGrid */}
        <Transition visible={visible} animation='fade' duration={500}>
          <div>
  {/* CardGrid code */}
          { !value ? <CardGrid siteData={siteData} /> : <CardGrid siteData={results} />}
          </div>
        </Transition>
        <br />
        { loaded &&
          <div>
            <hr />
  {/* WorldMap Title */}
            <Image centered src={Q1WorldTitle} />
            <ScrollableAnchor id={"map"}>
  {/* WorldMap */}
              <WorldMap handleMapObjectClick={this.handleMapObjectClick} />
            </ScrollableAnchor>
          </div>
        }
      <br />
      </Container>
  {/* Statistic cluster */}
      { loaded &&
        <Segment inverted className='Stats'>
          <Statistic.Group inverted >
            <Statistic className='Stat' inverted label='Continents' value='3' />
            <Statistic className='Stat' inverted label='Developments' value={this.state.siteData.length} />
            <Statistic className='Stat' inverted label='Commits' value={'21,432'} />
            <Statistic className='Stat' inverted label='Team Members' value='2' />
          </Statistic.Group>
        </Segment>
      }
    </Container>
    )
  }

  componentWillMount() {
    this.setState({
      loaded: false,
      visible: false
    })
    // Grab out messages from the API
    api.get('/').then((response) => {
      // Everything worked, response.data is our array of messages
      this.setState({
        siteData: response.data,
        loaded: true,
        visible: true
      })
      console.log('This is our state:', this.state.siteData)
      configureAnchors({keepLastAnchorHash: false})
    }).catch(function(error) {
      // Something went wrong
      console.warn(error);
    });
    this.resetComponent()
  }

  resetComponent = () => {
    this.setState({
      isLoading: false,
      results: this.state.siteData,
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
      value: event.mapObject.customData,
      visible: false
    })
    setTimeout(() => {
      if (this.state.value.length < 1) return this.resetComponent()

      const re = new RegExp(_.escapeRegExp(this.state.value), 'i')
      const isMatch = result => re.test(result.name.concat(result.tag))

      this.setState({
        isLoading: false,
        results: _.filter(this.state.siteData, isMatch),
        visible: true
      })
    }, 500)
      document.getElementById("searchbar").focus()
  }

  handleSearchChange = (e, { value }) => {
    this.setState({
      isLoading: true, value,
    }
  )

    setTimeout(() => {
      if (this.state.value.length < 1) return this.resetComponent()

      const re = new RegExp(_.escapeRegExp(this.state.value), 'i')
      const isMatch = result => re.test(result.name.concat(result.tag))

      this.setState({
        isLoading: false,
        results: _.filter(this.state.siteData, isMatch),

      })
    }, 500)
  }

  toggleVisibility = () => this.setState({ visible: !this.state.visible })

}

export default App;
