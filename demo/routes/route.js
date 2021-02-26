const express = require('express');
const router = express.Router();
// const router = express.Router({caseSensitive: true});


// var demoDetails=require('../api/tankValidation1')
var demoDetails=require('../api/tankValidate')







router.use('/tank',demoDetails);



module.exports = router;
