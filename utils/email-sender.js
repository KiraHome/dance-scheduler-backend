const nodeMailer = require('nodemailer');
const transporter = nodeMailer.createTransport({
    service: 'Gmail',
    auth: {
        user: 'forma.dance.scheduler@gmail.com',
        pass: 'FormaDance1'
    },
    logger: true,
    proxy: 'http://PITC-Zscaler-EMEA-Amsterdam3PR.proxy.corporate.ge.com:80/'
});

const sendMail = (mailTextHtml, subject, to) => {
    const mailOptions = {
        from: '"Forma Dance Scheduler " <forma.dance.scheduler@gmail.com>',
        html: mailTextHtml,
        subject: subject,
        to: to
    };

    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            return console.log(error.message);
        }
        console.log('Message sent: ' + info.response);
    });
};

module.exports.sendMail = sendMail;