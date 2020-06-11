let mysql = require('mysql2')

let db = mysql.createConnection({
    host: 'localhost',
    user: 'dbms',
    password: 'dbms',
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

const query2 = async (sql,args) => {
    try {
        let res = await query(sql, args);
        return [undefined, res];
    } catch (error) {
        return [error.sqlMessage];
    }
}

module.exports = {db,query, query2};
