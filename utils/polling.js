const client = require('../database/handler');
const AsyncPolling = require('async-polling');

function poll() {
    AsyncPolling(async (end) => {
        try {
            console.log('Polling deletes old rows from event flow...');
            await client.query('DELETE FROM event_flow WHERE "timestamp" <= NOW() - INTERVAL \'30 days\'');
        } catch (e) {
            console.log(e.stack);
        }
        end();
    }, 86400000).run();
}

module.exports.poll = poll;
