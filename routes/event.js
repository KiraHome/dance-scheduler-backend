const express = require('express');
const router = express.Router();
const client = require('../database/handler');

router.get('/', async (req, res) => {
    try {
        const result = await client.query('SELECT start, end_ as end, title, id, cssClass FROM timetable ORDER BY start ASC');
        res.send(result.rows);
    } catch (e) {
        console.log(e.stack);
        res.sendStatus(500);
    }
});

module.exports = router;
