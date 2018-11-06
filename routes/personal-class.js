const express = require('express');
const router = express.Router();
const client = require('../database/handler');

router.get('/', async (req, res) => {
    try {
        const result = await client.query('SELECT start, end_, title, color, id, cssclass, serial_id FROM personal_class');

        res.send(result.rows);
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(500);
    }
});

router.put('/', async (req, res) => {
    try {
        const body = req.body;
        const result = await client.query(
            'INSERT INTO personal_class(start, end_, title, color, id, cssclass) VALUES($1, $2, $3, $4, $5, $6) RETURNING *',
            [body.start, body.end, body.title, body.color, body.id, body.cssClass]
        );
        res.send({serial_id: result.rows[0].serial_id});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

router.delete('/*', async (req, res) => {
    try {
        await client.query('DELETE FROM personal_class WHERE serial_id=' + req.path.substring(1));
        res.send({serial_id: req.path.substring(1)});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

module.exports = router;
