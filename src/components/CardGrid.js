// React Components
import React, {Component} from 'react';

// Semantic.ui React Components
import {
         Icon,
         Card
       }
       from 'semantic-ui-react'

import {
       FacebookShareButton,
       LinkedinShareButton,
       TwitterShareButton,
       EmailShareButton,
} from 'react-share';

class CardGrid extends Component {

  render() {

    const { siteData } = this.props

    return (

      <Card.Group doubling stackable centered itemsPerRow={4}>
      {
        siteData.map((hash) => (
        <Card
          className='cards'
          href={hash.url}
          image={hash.image}
          header={hash.name}
          meta={hash.tags}
          description='Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum amet sapiente, dicta tempora eum dolores odio. Illum doloribus magnam nostrum.'
          extra={
          <div className="cardSocialIcons" align='center'>
            <FacebookShareButton
              url={hash.url}
              quote={hash.name}
              className="Fb_share-button">
              <Icon name='facebook f' />
            </FacebookShareButton>
            <TwitterShareButton
              url={hash.url}
              title={hash.title}
              className="Tw_share-button">
              <Icon name='twitter' />
            </TwitterShareButton>
            <LinkedinShareButton
              url={hash.url}
              title={hash.title}
              className="Lin_share-button">
              <Icon name='linkedin' />
            </LinkedinShareButton>
            <EmailShareButton
              url={hash.url}
              title={hash.title}
              className="Em_share-button">
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
