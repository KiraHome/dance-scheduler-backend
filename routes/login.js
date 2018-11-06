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

router.post('/facebook', async (req, res) => {
    try {
        const body = req.body;
        const user = await client.query('SELECT * FROM facebook WHERE name=$1 AND token=$2', [body.name, body.token]);
        if (user.rows.length === 0) {
            await client.query('INSERT INTO facebook(id, image, name, token, role) VALUES($1, $2, $3, $4, $5) RETURNING *',
                [body.id, body.image, body.name, body.token, 'USER']);
        }
        res.send({token: body.token});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

module.exports = router;
