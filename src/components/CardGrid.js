// React Components
import React, {Component} from 'react';

// Semantic.ui React Components
import {
         Icon,
         Card
       }
       from 'semantic-ui-react'

class CardGrid extends Component {

  render() {

    const { siteData } = this.props

    const extra = (
      <div className="cardSocialIcons" align='center'>
        <a><Icon name='facebook f' /></a>
        <a><Icon name='instagram' /></a>
        <a><Icon name='twitter' /></a>
      </div>
    )

    return (

      <Card.Group doubling stackable centered itemsPerRow={4}>
      {
        siteData.map((hash) => (
        <Card
          image={hash.image}
          header={hash.name}
          meta={hash.tags}
          description='Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum amet sapiente, dicta tempora eum dolores odio. Illum doloribus magnam nostrum.'
          extra={extra}
        />
        ))
      }
      </Card.Group>
    )
  }
}

export default CardGrid;
