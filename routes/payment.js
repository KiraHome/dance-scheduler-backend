const express = require('express');
const router = express.Router();
const client = require('../database/handler');

router.get('/', async (req, res) => {
    try {
        const result = await client.query('SELECT username, lastpaid FROM payment');
        res.send(result.rows);
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(500);
    }
});

router.post('/', async (req, res) => {
    try {
        const body = req.body;
        await client.query('INSERT INTO payment(username, lastpaid) VALUES($1, $2) RETURNING *', [body.username, body.lastPaid]);
        res.send({ok: 'OK'});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

router.put('/', async (req, res) => {
    try {
        const body = req.body;
        await client.query('UPDATE payment SET lastpaid=$1 WHERE username=$2', [body.lastPaid, body.username]);
        res.send({ok: 'OK'});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

module.exports = router;
