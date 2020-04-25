const db = require('../config/database_config');

let User = {};
const user_table = 'questionbox_appusers';
const user_follow_table = 'questionbox_userfollows'

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

User.get_user = async (field, value) => {
    let query = `SELECT * FROM ${user_table} WHERE ${field} = ?`
    try{
        let res = await db.query(query,value);
        return res;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

User.update_user = async (user,id) => {
    let query = `UPDATE ${user_table} SET ? WHERE id = ?`
    try{
        await db.query(query,[user,id]);
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

User.get_followers = async (id) => {
    let query = 'CALL get_user_followers(?)'
    let [err, res] = await db.query2(query, id);
    if(err)return [err];
    return [undefined, res[0]];
}

User.get_following = async (id) => {
    let query = 'CALL get_user_following(?)'
    let [err, res] = await db.query2(query, id);
    if(err)return [err];
    return [undefined, res[0]];
}

User.is_following = async (u_id, f_id) => {
    let query = `SELECT * FROM ${user_follow_table} WHERE follower_id = ? AND follows_id = ?`;
    let [err, res] = await db.query2(query, [u_id, f_id]);
    if(err)return [err];
    if(res.length == 0)return [undefined, false];
    return [undefined, true];
}

User.follow = async (u_id, f_id) => {
    let query = `INSERT INTO ${user_follow_table} SET ?`;
    let [err, res] = await db.query2(query, {follower_id : u_id, follows_id : f_id});
    if(err)return [err];
    return [undefined, true];
}

User.unfollow = async (u_id, f_id) => {
    let query = `DELETE FROM ${user_follow_table} WHERE follower_id = ? AND follows_id = ?`;
    let [err, res] = await db.query2(query, [u_id, f_id]);
    if(err)return [err];
    return [undefined, true];
}

module.exports = User;
