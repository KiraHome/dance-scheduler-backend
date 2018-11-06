const express = require('express');
// const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const eventRouter = require('./routes/event');
const commentRouter = require('./routes/comment');
const timeTableRouter = require('./routes/timetable');
const loginRouter = require('./routes/login');
const personalClassRouter = require('./routes/personal-class');
const eventFlowRouter = require('./routes/event-flow');
const app = express();

const port = process.env.PORT || 3001;


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
// app.use(express.static(path.join(__dirname, 'public')));

app.use('/*', (req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "*");
    res.header('Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE, OPTIONS');
    next();
});

app.use('/event', eventRouter);
app.use('/personal-class', personalClassRouter);
app.use('/comment', commentRouter);
app.use('/time-table', timeTableRouter);
app.use('/event-flow', eventFlowRouter);
app.use('/login', loginRouter);
app.use('/register', loginRouter);

app.options('/*', function (req, res) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    res.header('Access-Control-Allow-Headers', '*');
    res.sendStatus(200);
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

module.exports = app;
