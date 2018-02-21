// React Components
import React, {Component} from 'react';

// Semantic.ui React Components
import {
        Segment,
        Statistic
       } from 'semantic-ui-react';

class StatisticsBar extends Component {

  render() {

    // Destructuring props to be passed into components
    const {siteData} = this.props

    return (
      <div>
        <Segment inverted className='Stats'>
          <Statistic.Group inverted >
            <Statistic className='Stat' inverted label='Continents' value='3' />
            <Statistic className='Stat' inverted label='Developments' value={siteData.length} />
            <Statistic className='Stat' inverted label='Commits' value={'21,432'} />
            <Statistic className='Stat' inverted label='Team Members' value='2' />
          </Statistic.Group>
        </Segment>
      </div>
    )
  }
}

export default StatisticsBar;
