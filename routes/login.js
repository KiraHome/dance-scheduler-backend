const express = require('express');
const router = express.Router();
const client = require('../database/handler');
const btoa = require('btoa');

router.get('/', async (req, res) => {
    const username = req.get('username');
    const pass = req.get('pass');
    const result = await client.query('SELECT username, password FROM credential');

    if (result.rows.filter(user => user.username === username && user.password.toLowerCase() === pass.toLowerCase()).length > 0) {
        res.send({basic: 'Basic ' + btoa(username + ':' + pass)});
    } else {
        res.sendStatus(403);
    }
});

router.post('/', async (req, res) => {
    try {
        const body = req.body;
        await client.query('INSERT INTO credential(username, password, privilege, fb_reg) VALUES($1, $2, $3, $4) RETURNING *',
            [body.userName, body.password, 'USER', false]);
        res.send({basic: 'Basic ' + btoa(body.userName + ':' + body.password)});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

module.exports = router;
