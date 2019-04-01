const express = require('express');
const cookieParser = require('cookie-parser');
const logger = require('morgan');

const eventRouter = require('./routes/event');
const commentRouter = require('./routes/comment');
const timeTableRouter = require('./routes/timetable');
const loginRouter = require('./routes/login');
const personalClassRouter = require('./routes/personal-class');
const eventFlowRouter = require('./routes/event-flow');
const paymentRouter = require('./routes/payment');
const accountingRouter = require('./routes/accounting');

const app = express();
const router = express.Router();

const pollingService = require('./utils/polling');

const passport = require('passport');
const Strategy = require('passport-facebook').Strategy;

const port = process.env.PORT || 3001;

const fs = require('fs');
const https = require('https');
const httpsOptions = {
    key: fs.readFileSync('/etc/nginx/certs/server.com.key'),
    cert: fs.readFileSync('/etc/nginx/certs/server.com.crt'),
    ca: fs.readFileSync('/etc/nginx/certs/ca.crt')
};

pollingService.poll();

passport.use(new Strategy({
        clientID: 1771148716341703,
        clientSecret: '1daeb7df8d47fe256889a1d3af295c38',
        callbackURL: 'http://localhost:3001/auth/facebook/return'
    },
    function (accessToken, refreshToken, profile, cb) {
        return cb(null, profile);
    }));

app.use(passport.initialize());
app.use(passport.session());

router.get('/auth/facebook',
    passport.authenticate('facebook'));

router.get('/auth/facebook/callback',
    passport.authenticate('facebook', {failureRedirect: '/login'}),
    function (req, res) {
        res.redirect('/');
    });

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());

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
app.use('/payment', paymentRouter);
app.use('/accounting', accountingRouter);

app.options('/*', function (req, res) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    res.header('Access-Control-Allow-Headers', '*');
    res.send({ok: 'OK'});
});

// app.listen(port, () => console.log(`Dance Scheduler Express app listening on port ${port}!`));

console.log(`Dance Scheduler Express app listening on port ${port}!`);
https.createServer(httpsOptions, app).listen(port);

module.exports = app;
