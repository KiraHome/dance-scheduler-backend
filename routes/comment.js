const express = require('express');
const router = express.Router();
const client = require('../database/handler');

router.get('/', async (req, res) => {
    try {
        const result = await client.query('SELECT name, created_date, comment, on_page FROM comment ORDER BY created_date DESC');
        res.send(result.rows);
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(500);
    }
});

router.put('/', async (req, res) => {
    try {
        const body = req.body;
        await client.query('INSERT INTO comment(name, comment, created_date, on_page) VALUES($1, $2, $3, $4) RETURNING *', [body.name, body.comment, body.created_date, body.onPage]);
        res.sendStatus(200);
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

module.exports = router;
