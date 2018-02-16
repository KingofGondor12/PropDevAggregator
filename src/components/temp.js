// React Components
import React, {Component} from 'react';
import PropTypes from 'prop-types';
import ScrollableAnchor from 'react-scrollable-anchor';
import configureAnchors from 'react-scrollable-anchor';
// Semantic.ui React Components
import {
        Container,
        Search,
        Label,
        Image,
        Loader,
        Button,
        Menu,
        Dropdown,
        Divider,
        Grid,
        Header,
        List,
        Segment,
        Icon,
        Visibility
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

const menuStyle = {
  border: 'none',
  borderRadius: 0,
  boxShadow: 'none',
  marginBottom: '1em',
  marginTop: '4em',
  transition: 'box-shadow 0.5s ease, padding 0.5s ease',
}

const fixedMenuStyle = {
  backgroundColor: '#fff',
  border: '1px solid #ddd',
  boxShadow: '0px 3px 5px rgba(0, 0, 0, 0.2)',
}

const overlayStyle = {
  float: 'left',
  margin: '0em 3em 1em 0em',
}

const fixedOverlayStyle = {
  ...overlayStyle,
  position: 'fixed',
  top: '80px',
  zIndex: 10,
}

const overlayMenuStyle = {
  position: 'relative',
  left: 0,
  transition: 'left 0.5s ease',
}

const fixedOverlayMenuStyle = {
  ...overlayMenuStyle,
  left: '800px',
}

const LeftImage = () => (
  <Image
    floated='left'
    size='medium'
    src='/assets/images/wireframe/square-image.png'
    style={{ margin: '2em 2em 2em -4em' }}
  />
)

const RightImage = () => (
  <Image
    floated='right'
    size='medium'
    src='/assets/images/wireframe/square-image.png'
    style={{ margin: '2em -4em 2em 2em' }}
  />
)

class App extends Component {

state = {
  siteData: [],
  isLoading: false,
  value: '',
  results: [],
  loaded: null,
  menuFixed: false,
  overlayFixed: false,
}

render() {

  // Destructuring props to be passed into components
  const {siteData, isLoading, value, results, loaded, menuFixed, overlayFixed, overlayRect } = this.state
  return (
      <Container>
        <ScrollableAnchor id={"search"}>
          <div></div>
        </ScrollableAnchor>
        <Image centered src={Q1ClearTitleColor} />
          <Search
            id={'searchbar'}
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
          <hr /><br />
          <Visibility
            onBottomPassed={this.stickTopMenu}
            onBottomVisible={this.unStickTopMenu}
            once={false}
          >
            <Menu
              borderless
              fixed={menuFixed && 'top'}
              style={menuFixed ? fixedMenuStyle : menuStyle}
            >
              <Container text>
                <Menu.Item>
                  <Image size='mini' src='/logo.png' />
                </Menu.Item>
                <Menu.Item header>PropDev Aggregator</Menu.Item>
                <Menu.Item as='a' href="#map">WorldMap</Menu.Item>
                <Menu.Item as='a' href="#search">Search</Menu.Item>

                <Menu.Menu position='right'>
                  <Dropdown text='Dropdown' pointing className='link item'>
                    <Dropdown.Menu>
                      <Dropdown.Item>List Item</Dropdown.Item>
                      <Dropdown.Item>List Item</Dropdown.Item>
                      <Dropdown.Divider />
                      <Dropdown.Header>Header Item</Dropdown.Header>
                      <Dropdown.Item>
                        <i className='dropdown icon' />
                        <span className='text'>Submenu</span>
                        <Dropdown.Menu>
                          <Dropdown.Item>List Item</Dropdown.Item>
                          <Dropdown.Item>List Item</Dropdown.Item>
                        </Dropdown.Menu>
                      </Dropdown.Item>
                      <Dropdown.Item>List Item</Dropdown.Item>
                    </Dropdown.Menu>
                  </Dropdown>
                </Menu.Menu>
              </Container>
            </Menu>
          </Visibility>
        {/* <Button centered href="#map">WorldMap</Button><br /> */}
          <hr /><br />
        { !loaded && <Loader active size={'large'}>Loading</Loader> }
      <CardGrid siteData={siteData} />
        { loaded &&
          <div>
            <Image centered src={Q1WorldTitle} />
          <ScrollableAnchor id={"map"}>
            <WorldMap handleMapObjectClick={this.handleMapObjectClick} />
          </ScrollableAnchor>
          </div> }
        <br />

        {/* Attaching the top menu is a simple operation, we only switch `fixed` prop add add another styles if it has
            gone beyond the scope of visibility
          */}


        <Container text>

          {/* Example with overlay menu is more complex, SUI simply clones all elements inside, but we should use a
              different approach.
              An empty Visibility element controls the need to change the fixing of element below, it also uses height
              and width params received from its ref for correct display.
            */}
          <Visibility
            offset={80}
            once={false}
            onTopPassed={this.stickOverlay}
            onTopVisible={this.unStickOverlay}
            style={overlayFixed ? { ...overlayStyle, ...overlayRect } : {}}
          />

          <div
            ref={this.handleOverlayRef}
            style={overlayFixed ? fixedOverlayStyle : overlayStyle}
          >
            <Menu
              icon='labeled'
              style={overlayFixed ? fixedOverlayMenuStyle : overlayMenuStyle}
              vertical
            >
              <Menu.Item>
                <Icon name='twitter' />
               Twitter
              </Menu.Item>

              <Menu.Item >
                <Icon name='facebook' />
               Share
              </Menu.Item>

              <Menu.Item>
                <Icon name='mail' />
               Email
              </Menu.Item>
            </Menu>
          </div>
        </Container>

        <Segment
          inverted
          style={{ margin: '5em 0em 0em', padding: '5em 0em' }}
          vertical
        >
          <Container textAlign='center'>
            <Divider inverted section />
            <Image src='/logo.png' centered size='mini' />
            <List horizontal inverted divided link>
              <List.Item as='a' href='#'>Site Map</List.Item>
              <List.Item as='a' href='#'>Contact Us</List.Item>
              <List.Item as='a' href='#'>Terms and Conditions</List.Item>
              <List.Item as='a' href='#'>Privacy Policy</List.Item>
            </List>
          </Container>
        </Segment>
      </Container>
    )
  }

  componentWillMount() {
    this.setState({loaded: false})
    // Grab out messages from the API
    api.get('/').then((response) => {
      // Everything worked, response.data is our array of messages
      this.setState({siteData: response.data, loaded: true})
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
      document.getElementById("searchbar").focus();
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

  handleOverlayRef = (c) => {
    const { overlayRect } = this.state

    if (!overlayRect) this.setState({ overlayRect: _.pick(c.getBoundingClientRect(), 'height', 'width') })
  }

  stickOverlay = () => this.setState({ overlayFixed: true })

  stickTopMenu = () => this.setState({ menuFixed: true })

  unStickOverlay = () => this.setState({ overlayFixed: false })

  unStickTopMenu = () => this.setState({ menuFixed: false })

}

export default App;
