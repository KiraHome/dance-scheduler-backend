const express = require('express');
const router = express.Router();
const client = require('../database/handler');
const btoa = require('btoa');

router.get('/', async (req, res) => {
    const username = req.get('username');
    const pass = req.get('pass');

    try {
        const result = await client.query('SELECT username, password FROM credential');

        if (result.rows.filter(user => user.username === username && user.password.toLowerCase() === pass.toLowerCase()).length > 0) {
            res.send({basic: 'Basic ' + btoa(username + ':' + pass)});
        } else {
            res.sendStatus(403);
        }
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(500);
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
        const user = await client.query('SELECT * FROM credential WHERE username=$1', [body.name]);
        if (user.rows.length === 0) {
            await client.query('INSERT INTO credential(fb_id, image, username, token, privilege, fb_reg) VALUES($1, $2, $3, $4, $5, $6) RETURNING *',
                [body.id, body.image, body.name, body.token, 'USER', true]);
        } else {
            await client.query('UPDATE credential SET token=$1 WHERE username=$2',
                [body.token, body.name]);
        }
        res.send({token: body.token});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

router.put('/facebook', async (req, res) => {
    try {
        const body = req.body;
        const userData = body.userData;
        const username = body.username;
        const userpass = body.userpass;

        await client.query('UPDATE credential SET fb_reg=TRUE, token=$1, fb_id=$2 WHERE username=$3 AND password=$4', [userData.token, userData.id, username, userpass]);
        res.send({token: body.token});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

router.get('/is-admin', async (req, res) => {
    const username = req.get('username');
    const token = req.get('token');

    if (!token.startsWith('Basic')) {
        res.sendStatus(403);
    }

    try {
        const result = await client.query('SELECT privilege FROM credential WHERE username=$1', [username]);

        if (result.rows.length === 1 && result.rows[0].privilege === 'ADMIN') {
            res.send({ok: 'OK'});
        } else {
            res.sendStatus(403);
        }
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(500);
    }
});

router.get('/fb-ids', async (req, res) => {
    try {
        const result = await client.query('SELECT username, fb_reg, fb_id FROM credential');
        res.send(result.rows);
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(500);
    }
});

module.exports = router;
