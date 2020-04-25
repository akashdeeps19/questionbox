const db = require('../config/database_config');

let Topic = {};
const topics_table = 'questionbox_topics';
const questiontopics_table = 'questionbox_questiontopics';
const question_table = 'questionbox_questions';
const topic_follow_table = 'questionbox_topicfollows'

Topic.post_topic = async (topic) => {
    let query = `INSERT INTO ${topics_table} SET ?`;
    let [err, res] = await db.query2(query,topic);
    if(err)return [err];
    return [undefined, res.insertId];
}

Topic.get_topic = async (query, values) => {
    let sql = `SELECT * FROM ${topics_table} WHERE ${query}`;
    let [err, res] = await db.query2(sql, values);
    if(err)return [err];
    return [undefined, res];
}

Topic.get_topics = async () => {
    let sql = `SELECT * FROM ${topics_table}`;
    let [err, res] = await db.query2(sql);
    if(err)return [err];
    return [undefined, res];
}

Topic.update_topic = async (topic, t_id) => {
    let query = `UPDATE ${topics_table} SET ? WHERE id = ?`;
    let [err, res] = await db.query2(query, [topic, t_id]);
    if(err)return [err];
    return [undefined, true];
}

Topic.delete_topic = async (t_id) => {
    let query = `DELETE FROM ${topics_table} WHERE id = ?`;
    let [err, res] = await db.query2(query, [t_id]);
    if(err)return [err];
    return [undefined, true];
}

Topic.add_questiontopic = async (t_id, q_id) => {
    let query = `INSERT INTO ${questiontopics_table} SET ?`;
    let [err, res] = await db.query2(query,{topic_id : t_id, question_id : q_id});
    if(err)return [err];
    return [undefined, res.insertId];
}

Topic.get_questiontopics = async (values) => {
    let sql = `SELECT t.name FROM ${questiontopics_table} qt, ${topics_table} t WHERE qt.question_id = ? and t.id = qt.topic_id`;
    let [err, res] = await db.query2(sql, values);
    if(err)return [err];
    return [undefined, res];
}

Topic.get_topicquestions = async (values) => {
    let sql = `SELECT q.* FROM ${questiontopics_table} qt, ${question_table} q WHERE qt.topic_id = ? and q.id = qt.question_id`;
    let [err, res] = await db.query2(sql, values);
    if(err)return [err];
    return [undefined, res];
}

Topic.delete_questiontopic = async (t_id, q_id) => {
    let query = `DELETE FROM ${questiontopics_table} WHERE topic_id = ? and question_id = ?`;
    let [err, res] = await db.query2(query, [t_id, q_id]);
    if(err)return [err];
    return [undefined, true];
}

Topic.get_followers = async (id) => {
    let query = 'CALL get_topic_followers(?)'
    let [err, res] = await db.query2(query, id);
    if(err)return [err];
    return [undefined, res[0]];
}

Topic.get_following = async (u_id) => {
    let query = 'CALL get_following_topics(?)'
    let [err, res] = await db.query2(query, u_id);
    if(err)return [err];
    return [undefined, res[0]];
}

Topic.is_following = async (u_id, t_id) => {
    let query = `SELECT * FROM ${topic_follow_table} WHERE user_id = ? AND topic_id = ?`;
    let [err, res] = await db.query2(query, [u_id, t_id]);
    if(err)return [err];
    if(res.length == 0)return [undefined, false];
    return [undefined, true];
}

Topic.follow = async (u_id, t_id) => {
    let query = `INSERT INTO ${topic_follow_table} SET ?`;
    let [err, res] = await db.query2(query, {user_id : u_id, topic_id : t_id});
    if(err)return [err];
    return [undefined, true];
}

Topic.unfollow = async (u_id, t_id) => {
    let query = `DELETE FROM ${topic_follow_table} WHERE user_id = ? AND topic_id = ?`;
    let [err, res] = await db.query2(query, [u_id, t_id]);
    if(err)return [err];
    return [undefined, true];
}

module.exports = Topic;

