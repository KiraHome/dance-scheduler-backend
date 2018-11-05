const express = require('express');
const router = express.Router();
const client = require('../database/handler');

router.get('/', async (req, res) => {
    const result = await client.query('SELECT start, end_, title, color, id, cssclass FROM timetable');

    res.send(result.rows);
});

module.exports = router;
