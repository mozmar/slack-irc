var createBots = require('./dist/helpers').createBots;
var config = require('./config.json');

config.token = process.env.SLACK_TOKEN;
config.loglevel = process.env.LOG_LEVEL || 'info';

createBots(config);
