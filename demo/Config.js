const mysql = require('mysql');


var db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "tank",
    multipleStatements: true
});

db.connect (function (err) {
    if (err) {
        console.log(err)
        console.log("Error occured while connecting to tank database");
    } else{ 
        console.log("Successfully connected to tank database");
    }
});
module.exports = db;