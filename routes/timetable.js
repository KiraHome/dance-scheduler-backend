const express = require('express');
const router = express.Router();
const client = require('../database/handler');
const mailSender = require('../utils/email-sender');

router.get('/', async (req, res) => {
    try {
        const result = await client.query('SELECT start, end_, title, color, id, cssclass, recurring, serial_id FROM timetable');
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
            'INSERT INTO timetable(start, end_, title, color, id, cssclass, recurring, serial_id) VALUES($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *',
            [body.start, body.end, body.title, body.color, body.id, body.cssClass, false, Math.floor(Math.random() * Math.floor(686876876))]
        );

        const start = new Date(body.start).toLocaleString('HU-hu');
        const end = new Date(body.end).toLocaleString('HU-hu');
        mailSender.sendMail('<pre>' + body.title + ' ' + start + '-tól ' + end + '-ig</pre>', body.title, 'preszl.daniel@gmail.com');

        res.send({serial_id: result.rows[0].serial_id});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

router.delete('/*', async (req, res) => {
    const serialId = req.path.substring(1);
    try {
        const result = await client.query('SELECT start, end_, title FROM timetable WHERE serial_id=' + serialId);
        await client.query('DELETE FROM timetable WHERE serial_id=' + serialId);

        const start = new Date(result.rows[0].start).toLocaleString('HU-hu');
        const end = new Date(result.rows[0].end_).toLocaleString('HU-hu');
        mailSender.sendMail('<pre>' + result.rows[0].title + ' ' + start + '-tól ' + end + '-ig <b>TÖRÖLVE</b> </pre>',
            result.rows[0].title + ' - törölve', 'preszl.daniel@gmail.com');

        res.send({serial_id: serialId});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

module.exports = router;
