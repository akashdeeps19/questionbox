const db = require('../config/database_config');

let User = {};
const user_table = 'questionbox_appusers';

User.add_user = async (user) => {
    let query = `INSERT INTO ${user_table} SET ?`;
    try{
        let res = await db.query(query,user);
        return res.insertId;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

User.get_all_users = async () => {
    let query = `SELECT * FROM ${user_table}`;
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

User.update_user = async (user) => {
    let query = `UPDATE ${user_table} SET ? WHERE id = ?`
    try{
        await db.query(query,[user,user.id]);
        return true;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

User.update_user_password = async (password,id) => {
    let query = `UPDATE ${user_table} SET user_password = ? WHERE id = ?`
    try{
        await db.query(query,[password,id]);
        return true;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

User.delete_user = async (id) => {
    let query = `DELETE FROM ${user_table} WHERE id = ?`
    try{
        await db.query(query,id);
        return true;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

module.exports = User;
