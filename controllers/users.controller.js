const db = require('../config/database_config');

let User = {};

User.add_user = async (user) => {
    let query = `INSERT INTO questionbox_appusers SET ?`;
    try{
        let res = await db.query(query,user);
        return res.insertId;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

User.get_all_users = async () => {
    let query = `SELECT * FROM questionbox_appusers`;
    try{
        let res = await db.query(query);
        return res;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

User.get_user = async (user_name) => {
    let query = `CALL get_user(?)`;
    try{
        let res = await db.query(query,user_name);
        return res[0];
    }
    catch(err){
        throw err.sqlMessage;
    }
}

module.exports = User;

//usage
// const users = require('./controllers/users.controller');

// users.add_user({user_name : 't2',bio : 'fu', user_password : 'yo'})
// .then((res)=>console.log(res))
// .catch((err)=>console.log(err));

// users.get_all_users()
// .then((res)=>console.log(res))
// .catch((err)=>console.log(err));