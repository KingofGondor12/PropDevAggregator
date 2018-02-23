// React Components
import React, {Component} from 'react';

// Semantic.ui React Components
import {
        Segment,
        Statistic,
        Icon
       } from 'semantic-ui-react';

class StatisticsBar extends Component {

  render() {

    // Destructuring props to be passed into components
    const {siteData} = this.props

    return (
      <div>
        <Segment className='Stat__Segment' inverted className='Stats'>
          <Statistic.Group size={'tiny'} inverted >
            <Statistic className='Stat' inverted label='Continents' value='3' />
            <Statistic className='Stat' inverted label='Developments' value={siteData.length} />
            <Statistic className='Stat' inverted label='Christopher Maier' value={<a href='https://github.com/ChristopherMaierInc' target='_blank'><Icon name='hand victory' size='big' /></a>} />
            <Statistic className='Stat'  inverted label='Chris Hayward' value={<a href='https://github.com/KingofGondor12' target='_blank'><Icon name='fork' size='big' /></a>} />
          </Statistic.Group>
        </Segment>
      </div>
    )
  }
}

export default StatisticsBar;
