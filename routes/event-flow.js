const express = require('express');
const router = express.Router();
const client = require('../database/handler');

router.get('/', async (req, res) => {
    try {
        const result = await client.query('SELECT source, priority, content, "timestamp", username FROM event_flow');
        res.send(result.rows);
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(500);
    }
});

router.post('/', async (req, res) => {
    try {
        const body = req.body;
        await client.query('INSERT INTO event_flow(source, priority, content, "timestamp", username) VALUES($1, $2, $3, $4, $5) RETURNING *',
            [body.source, body.priority, body.content, body.timestamp, body.username]);
        res.sendStatus(200);
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

module.exports = router;
