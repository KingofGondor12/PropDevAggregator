import React, { Component } from 'react';

class Grid extends Component {

  render() {

    const { siteData } = this.props
    console.log(this.props.siteData)

    return (
      <div className="column">
        <div className="ui link cards">
        {
          siteData.map((hash) => (
            <div className="card">
              <div className="image">
                <img src={hash.image} />
              </div>
              <div className="content">
                <a href={hash.url}>
                  {hash.name}
                </a>
              </div>
            </div>
          ))
        }
        </div>
      </div>
    );
  }
}

export default Grid;
