const db = require('../config/database_config');
const Topic  = require('./topics.services');
const Answer = require('./answers.services');

let Question = {};
const question_table = 'questionbox_questions';
const question_upvotes_table = 'questionbox_questionupvotes';
const question_downvotes_table = 'questionbox_questiondownvotes';
const question_follow_table = 'questionbox_questionfollows'

Question.add_question = async (question) => {
    let topics = question.topics;
    delete question.topics;
    let query = `INSERT INTO ${question_table} SET ?`;
    try{
        let res = await db.query(query,question);
        for(let topic of topics){
            let [err2, res2] = await Topic.add_questiontopic(topic,res.insertId);
            if(err2)throw err2;
        }
        return res.insertId;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

Question.get_all_questions = async (topic) => {
    let query = `SELECT * FROM ${question_table}`;
    let questions = [];
    try{
        let res;
        if(topic == undefined)
            res = await db.query(query);
        else{
            [err, res] = await Topic.get_topicquestions(topic);
        }
        for(let q of res){
            questions.push(await Question.get_question(q.id, false));
        }
        console.log(questions)
        return questions;
    }
    catch(err){
        throw err.sqlMessage;
    }
}

Question.get_question = async (id,view) => {
    let query = `CALL get_question(?,${view})`;
    try{
        let res = await db.query(query,id);
        res[0][0]['topics'] = res[1];
        res[0][0]['answers'] = await Answer.get_answers(id);
        // console.log(res)
        let qu = `SELECT count(*) from ${question_upvotes_table} WHERE question_id = ?`;
        let u = await db.query(qu, id);
        res[0][0]['upvotes'] = u[0]['count(*)'];
        let qd = `SELECT count(*) from ${question_downvotes_table} WHERE question_id = ?`;
        let d = await db.query(qd, id);
        res[0][0]['downvotes'] = d[0]['count(*)'];
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
        return true;
    } catch (err) {
        throw err.sqlMessage;
    }
}

Question.upvote_cancel = async (q_id, u_id) => {
    let q1 = `DELETE FROM ${question_upvotes_table} WHERE question_id = ? and user_id = ?`;
    try {
        await db.query(q1,[q_id, u_id]); 
        return true;
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
    return [undefined, true];
}

Question.downvote_cancel = async (q_id, u_id) => {
    let q1 = `DELETE FROM ${question_downvotes_table} WHERE question_id = ? and user_id = ?`;
    let [err1, res1] = await db.query2(q1, [q_id, u_id]);
    if(err1)return [err1];
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

Question.get_followers = async (id) => {
    let query = 'CALL get_question_followers(?)'
    let [err, res] = await db.query2(query, id);
    if(err)return [err];
    return [undefined, res[0]];
}

Question.get_following = async (u_id) => {
    let query = 'CALL get_following_questions(?)'
    let [err, res] = await db.query2(query, u_id);
    if(err)return [err];
    return [undefined, res[0]];
}

Question.is_following = async (u_id, q_id) => {
    let query = `SELECT * FROM ${question_follow_table} WHERE user_id = ? AND question_id = ?`;
    let [err, res] = await db.query2(query, [u_id, q_id]);
    if(err)return [err];
    if(res.length == 0)return [undefined, false];
    return [undefined, true];
}

Question.follow = async (u_id, q_id) => {
    let query = `INSERT INTO ${question_follow_table} SET ?`;
    let [err, res] = await db.query2(query, {user_id : u_id, question_id : q_id});
    if(err)return [err];
    return [undefined, true];
}

Question.unfollow = async (u_id, q_id) => {
    let query = `DELETE FROM ${question_follow_table} WHERE user_id = ? AND question_id = ?`;
    let [err, res] = await db.query2(query, [u_id, q_id]);
    if(err)return [err];
    return [undefined, true];
}

module.exports = Question;