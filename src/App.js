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
        Transition
       } from 'semantic-ui-react';

// Stylesheets
import './App.css';

// Child Components
import CardGrid from './components/CardGrid';
import WorldMap from './components/WorldMap';
import LoadingScreen from './components/LoadingScreen';
import StatisticsBar from './components/StatisticsBar';

// API/Axios
import {api} from './api/init';

// Lodash
import _ from 'lodash';

// Q1ClearTitle
import Q1ClearTitleColor from './images/PropDevTitle_CMaier.png';
import Q1WorldTitle from './images/PropDevWorldwide_CMaier.png';

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

  // Destructuring props to be passed to components
  const {siteData, isLoading, value, results, loaded, visible } = this.state

  return (
    <Container fluid >
      <Container>

  {/* Loading spinner */}
        {!loaded && <LoadingScreen />}
  {/* Anchor for clickable-map. Scrolls to top of page to search bar */}
        <ScrollableAnchor id={'search'}>
          <div></div>
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
          value={value}
          open={false}
          placeholder='Search...'
          {...this.props}
        />
        <br />
  {/* Button cluster at top of page */}
        <div className='buttonMenu'>
          <Button.Group>
          <Button href='https://www.instagram.com/q1_design/' target='_blank' animated={'fade'}>
            <Button.Content visible>Instagram</Button.Content>
            <Button.Content hidden>
              <Icon name='instagram' size='large' />
            </Button.Content>
          </Button>
          <Button href='https://www.facebook.com/q1design/' target='_blank' animated={'fade'}>
            <Button.Content visible>Facebook</Button.Content>
            <Button.Content hidden>
              <Icon name='facebook square' size='large' />
            </Button.Content>
          </Button>
        </Button.Group>
            <Button id='button__worldwide' href='#map' animated={'fade'}>
              <Button.Content visible>Worldwide Developments</Button.Content>
              <Button.Content hidden>
                <Icon name='world' size='large' />
              </Button.Content>
            </Button>
            <Button.Group>
            <Button href='https:/www.q1design.net' target='_blank' animated={'fade'}>
              <Button.Content visible>Q1 Design</Button.Content>
              <Button.Content hidden>
                <Icon name='tv' size='large' />
              </Button.Content>
            </Button>
            <Button href='https://bitbucket.org/presentplatekain/dev-real-estate' target='_blank' animated={'fade'}>
              <Button.Content visible>Support</Button.Content>
              <Button.Content hidden>
                <Icon name='git square' size='large' />
              </Button.Content>
            </Button>
          </Button.Group>
  {/* Test button for visibility toggle */}
          {/* <Button content={visible ? 'Hide' : 'Show'} onClick={this.toggleVisibility} /> */}
        </div>
        <br />
        <hr />
        <br />
  {/* Trasition code for CardGrid component */}
        <Transition visible={visible} animation='fade' duration={500}>
          <div>
  {/* CardGrid component */}
          {!value ? <CardGrid siteData={siteData} /> : <CardGrid siteData={results} />}
          </div>
        </Transition>
        <br />
        {loaded &&
          <div>
            <hr />
  {/* WorldMap Title image */}
            <Image centered src={Q1WorldTitle} />
            <ScrollableAnchor id={'map'}>
  {/* WorldMap component */}
              <WorldMap handleMapObjectClick={this.handleMapObjectClick} />
            </ScrollableAnchor>
          </div>
        }
        <br />
      </Container>
  {/* Statistics cluster */}
      {loaded && <StatisticsBar siteData={siteData} />}
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
      const isMatch = result => re.test(result.name.concat([result.tag, result.code, result.type]))

      this.setState({
        isLoading: false,
        results: _.filter(this.state.siteData, isMatch),
        visible: true
      })
    }, 500)
      document.getElementById('searchbar').focus()
  }

  handleSearchChange = (e, { value }) => {
    this.setState({
      isLoading: true, value,
    }
  )

    setTimeout(() => {
      if (this.state.value.length < 1) return this.resetComponent()

      const re = new RegExp(_.escapeRegExp(this.state.value), 'i')
      const isMatch = result => re.test(result.name.concat([result.tag, result.code, result.type]))

      this.setState({
        isLoading: false,
        results: _.filter(this.state.siteData, isMatch),
      })
    }, 500)
  }

  toggleVisibility = () => this.setState({ visible: !this.state.visible })

}

export default App;
