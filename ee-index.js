var createBots = require('./lib/helpers').createBots;
var config = require('./config.json');

var slackToken = process.env.SLACK_TOKEN;
config.token = slackToken;

createBots(config);
