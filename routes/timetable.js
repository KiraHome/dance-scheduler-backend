const express = require('express');
const router = express.Router();
const client = require('../database/handler');

router.get('/', async (req, res) => {
    try {
        const result = await client.query('SELECT start, end_, title, color, id, cssclass FROM timetable');
        res.send(result.rows);
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(500);
    }
});

module.exports = router;
