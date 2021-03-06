const express = require('express');
const router = express.Router();
const client = require('../database/handler');
const mailSender = require('../utils/email-sender');

router.get('/', async (req, res) => {
    try {
        const result = await client.query('SELECT start, end_, title, color, id, cssclass, serial_id, recurring, last_paid_class FROM personal_class');
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
            'INSERT INTO personal_class(start, end_, title, color, id, cssclass, recurring) VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING *',
            [body.start, body.end, body.title, body.color, body.id, body.cssClass, body.recurring]
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
    try {
        const result = await client.query('SELECT start, end_, title FROM personal_class WHERE serial_id=' + req.path.substring(1));

        if (result) {
            await client.query('DELETE FROM personal_class WHERE serial_id=' + req.path.substring(1));

            const start = new Date(result.rows[0].start).toLocaleString('HU-hu');
            const end = new Date(result.rows[0].end_).toLocaleString('HU-hu');
            mailSender.sendMail('<pre>' + result.rows[0].title + ' ' + start + '-tól ' + end + '-ig <b>TÖRÖLVE</b> </pre>',
                result.rows[0].title + ' - törölve', 'preszl.daniel@gmail.com');
        }

        res.send({serial_id: req.path.substring(1)});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

router.put('/pay', async (req, res) => {
    try {
        const body = req.body;
        await client.query(
            'UPDATE personal_class SET last_paid_class=$1 WHERE serial_id=$2',
            [body.lastPaidClass, body.serial_id]
        );

        const start = new Date(body.start).toLocaleString('HU-hu');
        const end = new Date(body.end).toLocaleString('HU-hu');
        mailSender.sendMail('<pre>' + body.title + ' ' + start + '-tól ' + end + '-ig KIFIZETVE</pre>', body.title, 'preszl.daniel@gmail.com');

        res.send({serial_id: body.serial_id});
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(400);
    }
});

module.exports = router;
