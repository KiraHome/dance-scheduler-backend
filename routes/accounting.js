const express = require('express');
const router = express.Router();
const client = require('../database/handler');

router.get('/', async (req, res) => {
    const username = req.get('username');
    const token = req.get('token');

    try {
        const user = await client.query('SELECT privilege FROM credential WHERE username=$1 AND token=$2', [username, token]);

        console.log(user);
        if (user.rows.length > 0 && user.rows[0].privilege) {
            const result = await client.query('SELECT pay_timestamp, credit, type FROM accounting ORDER BY pay_timestamp ASC');
            res.send(result.rows);
        } else {
            res.sendStatus(403);
        }
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(500);
    }
});

router.put('/', async (req, res) => {
    const username = req.get('username');
    const token = req.get('token');

    try {
        const user = await client.query('SELECT privilege FROM credential WHERE username=$1 AND token=$2', [username, token]);

        if (user.rows[0].privilege) {
            const body = req.body;
            await client.query('INSERT INTO accounting(pay_timestamp, credit, type) VALUES($1, $2, $3) RETURNING *', [body.payTimestamp, body.credit, body.type]);
            res.send({ok: 'OK'});
        } else {
            res.sendStatus(403);
        }
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

module.exports = router;
