

const bunyan = require('bunyan');
const logger = bunyan.createLogger({name: "test-docker"});


const int = setInterval(() => {
    const num = Math.random();
    logger.info('Number is ' + num);
}, 1000);