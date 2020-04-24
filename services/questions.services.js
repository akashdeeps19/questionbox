const db = require('../config/database_config');

let Question = {};
const question_table = 'questionbox_questions';
const question_upvotes_table = 'questionbox_questionupvotes';
const question_downvotes_table = 'questionbox_questiondownvotes';

Question.add_question = async (question) => {
    let query = `INSERT INTO ${question_table} SET ?`;
    try{
        let res = await db.query(query,question);
        return res.insertId;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

Question.get_all_questions = async () => {
    let query = `SELECT * FROM ${question_table}`;
    try{
        let res = await db.query(query);
        return res;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

Question.get_question = async (id) => {
    let query = `CALL get_question(?,true)`;
    try{
        let res = await db.query(query,id);
        return res[0];
    }
    catch(err){
        throw err.sqlMessage;
    }
}

Question.get_upvote = async (q_id, u_id) => {
    let query = `SELECT * FROM ${question_upvotes_table} WHERE question_id = ? and user_id = ?`;
    try{
        let res = await db.query(query,[q_id,u_id]);
        return res.length == 0?false:true;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

Question.upvote = async (q_id, u_id) => {
    let q1 = `INSERT INTO ${question_upvotes_table} SET ?`
    try {
        await db.query(q1,{question_id : q_id, user_id : u_id}); 
        let q2 = `CALL question_upvote(?)`;
        try {
            await db.query(q2,q_id);
            return true;
        } catch (err) {
            throw err;
        }
    } catch (err) {
        throw err.sqlMessage;
    }
}

Question.upvote_cancel = async (q_id, u_id) => {
    let q1 = `DELETE FROM ${question_upvotes_table} WHERE question_id = ? and user_id = ?`;
    try {
        await db.query(q1,[q_id, u_id]); 
        let q2 = `CALL question_upvote_cancel(?)`;
        try {
            await db.query(q2,q_id);
            return true;
        } catch (err) {
            throw err;
        }
    } catch (err) {
        throw err.sqlMessage;
    }
}

Question.toggle_upvote = async (q_id, u_id) => {
    try {
        let upvoted = await Question.get_upvote(q_id, u_id);
        if(!upvoted){
            try {
                await Question.upvote(q_id, u_id);
                return true;
            } catch (error) {
                throw error;
            }
        }
        else {
            try {
                await Question.upvote_cancel(q_id, u_id);
                return false;
            } catch (error) {
                throw error;
            }
        }
    } catch (error) {
        throw error;
    }
}

Question.get_downvote = async (q_id, u_id) => {
    let query = `SELECT * FROM ${question_downvotes_table} WHERE question_id = ? and user_id = ?`;
    let [err, res] = await db.query2(query, [q_id, u_id]);
    if(err)return [err];
    if(res.length == 0)return [undefined, false];
    return [undefined, true];
}

Question.downvote = async (q_id, u_id) => {
    let q1 = `INSERT INTO ${question_downvotes_table} SET ?`;
    let [err1, res1] = await db.query2(q1, {question_id : q_id, user_id : u_id});
    if(err1)return [err1];
    let q2 = `CALL question_downvote(?)`;
    let [err2, res2] = await db.query2(q2, q_id);
    if(err2)return [err2];
    return [undefined, true];
}

Question.downvote_cancel = async (q_id, u_id) => {
    let q1 = `DELETE FROM ${question_downvotes_table} WHERE question_id = ? and user_id = ?`;
    let [err1, res1] = await db.query2(q1, [q_id, u_id]);
    if(err1)return [err1];
    let q2 = `CALL question_downvote_cancel(?)`;
    let [err2, res2] = await db.query2(q2, q_id);
    if(err2)return [err2];
    return [undefined, true];
}

Question.update_question = async (question,id) => {
    let query = `UPDATE ${question_table} SET ? WHERE id = ?`
    try{
        await db.query(query,[question,id]);
        return true;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

Question.delete_question = async (id) => {
    let query = `DELETE FROM ${question_table} WHERE id = ?`
    try{
        await db.query(query,id);
        return true;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

module.exports = Question;