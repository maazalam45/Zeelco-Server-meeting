const mysql = require("mysql");

var pool = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "zeelco",
});

// pool.connect(function (err) {
//   if (err) {
//     console.log(err);
//   }
// });

module.exports = pool;
