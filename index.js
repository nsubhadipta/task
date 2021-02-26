'use strict';
const express = require('express');
const bodyParser = require('body-parser');

var demo = require('./demo/routes/route');

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));    
app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.header('Access-Control-Allow-Methods', 'PUT, POST, GET, DELETE, OPTIONS');
    next();
});

app.use('/demo', demo);


var server = app.listen(process.env.PORT || '3000', function () {
    console.log('Server running on port ', server.address().port);
});