const db = require('../config/database_config');

let Answer = {};
const answer_table = 'questionbox_answers';
const answer_upvotes_table = 'questionbox_answerupvotes';
const answer_downvotes_table = 'questionbox_answerdownvotes';

Answer.post_answer = async (answer) => {
    let query = `INSERT INTO ${answer_table} SET ?`;
    let [err, res] = await db.query2(query,answer);
    if(err)return [err];
    return [undefined, res.insertId];
}

Answer.get_answers = async (q_id) => {
    let query = `SELECT * FROM ${answer_table} WHERE question_id = ?`;
    try{
        let res = await db.query(query,q_id);
        return res;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

Answer.get_answer = async (query, values) => {
    let sql = `SELECT * FROM ${answer_table} WHERE ${query}`;
    try{
        let res = await db.query(sql, values);
        let qu = `SELECT count(*) from ${answer_upvotes_table} WHERE answer_id = ?`;
        let u = await db.query(qu, values);
        res[0]['upvotes'] = u[0]['count(*)'];
        let qd = `SELECT count(*) from ${answer_downvotes_table} WHERE answer_id = ?`;
        let d = await db.query(qd, values);
        res[0]['downvotes'] = d[0]['count(*)'];
        return res;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

Answer.get_answer2 = async (query, values) => {
    let sql = `SELECT * FROM ${answer_table} WHERE ${query}`;
    let [err, res] = await db.query2(sql, values);
    if(err)return [err];
    return [undefined, res];
}

Answer.get_upvote = async (a_id, u_id) => {
    let query = `SELECT * FROM ${answer_upvotes_table} WHERE answer_id = ? and user_id = ?`;
    let [err, res] = await db.query2(query, [a_id, u_id]);
    if(err)return [err];
    if(res.length == 0)return [undefined, false];
    return [undefined, true];
}

Answer.upvote = async (a_id, u_id) => {
    let q1 = `INSERT INTO ${answer_upvotes_table} SET ?`;
    let [err1, res1] = await db.query2(q1, {answer_id : a_id, user_id : u_id});
    if(err1)return [err1];
    // let q2 = `CALL answer_upvote(?)`;
    // let [err2, res2] = await db.query2(q2, a_id);
    // if(err2)return [err2];
    return [undefined, true];
}

Answer.upvote_cancel = async (a_id, u_id) => {
    let q1 = `DELETE FROM ${answer_upvotes_table} WHERE answer_id = ? and user_id = ?`;
    let [err1, res1] = await db.query2(q1, [a_id, u_id]);
    if(err1)return [err1];
    // let q2 = `CALL answer_upvote_cancel(?)`;
    // let [err2, res2] = await db.query2(q2, a_id);
    // if(err2)return [err2];
    return [undefined, true];
}

Answer.get_downvote = async (a_id, u_id) => {
    let query = `SELECT * FROM ${answer_downvotes_table} WHERE answer_id = ? and user_id = ?`;
    let [err, res] = await db.query2(query, [a_id, u_id]);
    if(err)return [err];
    if(res.length == 0)return [undefined, false];
    return [undefined, true];
}

Answer.downvote = async (a_id, u_id) => {
    let q1 = `INSERT INTO ${answer_downvotes_table} SET ?`;
    let [err1, res1] = await db.query2(q1, {answer_id : a_id, user_id : u_id});
    if(err1)return [err1];
    // let q2 = `CALL answer_downvote(?)`;
    // let [err2, res2] = await db.query2(q2, a_id);
    // if(err2)return [err2];
    return [undefined, true];
}

Answer.downvote_cancel = async (a_id, u_id) => {
    let q1 = `DELETE FROM ${answer_downvotes_table} WHERE answer_id = ? and user_id = ?`;
    let [err1, res1] = await db.query2(q1, [a_id, u_id]);
    if(err1)return [err1];
    // let q2 = `CALL answer_downvote_cancel(?)`;
    // let [err2, res2] = await db.query2(q2, a_id);
    // if(err2)return [err2];
    return [undefined, true];
}

Answer.update_answer = async (answer, a_id) => {
    let query = `UPDATE ${answer_table} SET ? WHERE id = ?`;
    let [err, res] = await db.query2(query, [answer, a_id]);
    if(err)return [err];
    return [undefined, true];
}

Answer.delete_answer = async (a_id) => {
    let query = `DELETE FROM ${answer_table} WHERE id = ?`;
    let [err, res] = await db.query2(query, [a_id]);
    if(err)return [err];
    return [undefined, true];
}

module.exports = Answer;