// React Components
import React, {Component} from 'react';

// Semantic.ui React Components
import {
       Icon,
       Card,
       Flag,
       Header
       } from 'semantic-ui-react';
// Sharing Components
import {
       FacebookShareButton,
       LinkedinShareButton,
       TwitterShareButton,
       EmailShareButton,
       } from 'react-share';
// Truncate Text package
import Dotdotdot from 'react-dotdotdot';

class CardGrid extends Component {

  render() {

    const { siteData } = this.props

    return (

      <Card.Group doubling stackable centered itemsPerRow={4}>
      {
        siteData.map((hash) => (
        <Card
          className='cards'
          target='_blank'
          href={hash.url}
          image={hash.image}
          header={
                  <div>
                    <Header>
                      {hash.name}
                    </Header>
                    <Flag name={hash.code} />
                  </div>
                  }
          description={
                        <Dotdotdot className='dotDesc' clamp={5}>
                          {!hash.description ? 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem quia vero necessitatibus quas, quibusdam dignissimos magnam, eligendi, alias tempore maiores incidunt tenetur eum numquam neque animi! Consequatur laborum quae temporibus.' : hash.description}
                        </Dotdotdot>
                      }
          extra={
          <div className='cardSocialIcons'>
            <FacebookShareButton
              url={hash.url}
              quote={hash.name}
              className='Fb_share-button'>
              <Icon name='facebook f' />
            </FacebookShareButton>
            <TwitterShareButton
              url={hash.url}
              title={hash.title}
              className='Tw_share-button'>
              <Icon name='twitter' />
            </TwitterShareButton>
            <LinkedinShareButton
              url={hash.url}
              title={hash.title}
              className='Lin_share-button'>
              <Icon name='linkedin' />
            </LinkedinShareButton>
            <EmailShareButton
              url={hash.url}
              title={hash.title}
              className='Em_share-button'>
              <Icon name='mail outline' />
            </EmailShareButton>
          </div>}
        />
        ))
      }
      </Card.Group>
    )
  }
}

export default CardGrid;

// !hash.description.length ? `Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem quia vero necessitatibus quas, quibusdam dignissimos magnam, eligendi, alias tempore maiores incidunt tenetur eum numquam neque animi! Consequatur laborum quae temporibus.` :
