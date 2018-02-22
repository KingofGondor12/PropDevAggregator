PropDev Aggregator


This site was developed by Chris Hayward and Christopher Maier, combining Sinatra/Ruby with ReactJS, in collaboration with Q1 Design.

PropDev requires the following Gems, installed via the `gem install` command:

 * Sinatra
 * Sinatra/cors
 * Nokogiri
 * open-uri (as standard with Ruby)
 * net-http-ssl-fix
 * json

It also requires the following Packages, installed via the `npm install` or `yarn install` command:

 * amcharts3-react
 * ammap3
 * axios
 * lodash
 * prop-types
 * react
 * react-dom
 * react-dotdotdot
 * react-scripts
 * react-scrollable-anchor
 * react-share
 * semantic-ui-css
 * semantic-ui-react
---
Once the required Gems and Packages have been installed, follow these steps:

1. Open two instances of your command line into the PropDev directory
2. Run `ruby Sinatra_specific.rb` on one of them
3. Navigate to the second instance
4. Run `npm start` or `yarn start`
5. Watch it load in your browser

Note: If being put into production, ensure that the URL in src/api/init.js is correct, as it defaults to localhost as defined by Sinatra.
---

## Known Bugs:

 * Graphical glitch on page load, Dotdotdot won't render, pressing `CTRL+SHIFT+I` fixes it until page load.
