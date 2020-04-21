let mysql = require('mysql2')

let db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'questionbox'
})

db.connect(function(err) {
    if (err) {
      return console.error('error: ' + err.message);
    }
    console.log('Connected to the MySQL server.');
});

const query = (sql,args) => {
    return new Promise((reolve,reject)=>{
        db.query(sql,args,(err,res)=>{
            if(err)
                reject(err);
            reolve(res);
        })
    });
}

module.exports = {db,query};