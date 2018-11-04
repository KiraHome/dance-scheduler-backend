const express = require('express');
const router = express.Router();
const client = require('../database/handler');

router.get('/', async (req, res) => {
    const result = await client.query('SELECT name, created_date, comment, on_page FROM comment ORDER BY created_date ASC');

    res.send(result.rows);
});

module.exports = router;
