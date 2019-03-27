const {Client} = require('pg');
const client = new Client({
    user: 'postgres',
    host: '127.0.0.1',
    database: 'dance-scheduler',
    password: 'postgres',
    port: 5432,
});

(async () => {
    try {
        await client.connect();
    } catch (e) {
        console.log(e.stack);
    }
})();

module.exports = client;
