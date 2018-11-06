const express = require('express');
const router = express.Router();
const client = require('../database/handler');

router.get('/', async (req, res) => {
    const result = await client.query('SELECT name, pass FROM user');

    res.send(result.rows);
});

router.post('/', async (req, res) => {
    try {
        const body = req.body;
        await client.query('INSERT INTO user(name, pass) VALUES($1, $2) RETURNING *', [body.name, body.pass]);
        res.sendStatus(200);
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

module.exports = router;
