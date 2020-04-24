const db = require('../config/database_config');

let QuestionComment = {};
const comments_table = 'questionbox_questioncomments';

QuestionComment.post_comment = async (comment) => {
    let query = `INSERT INTO ${comments_table} SET ?`;
    let [err, res] = await db.query2(query,comment);
    if(err)return [err];
    return [undefined, res.insertId];
}

QuestionComment.get_comment = async (query, values) => {
    let sql = `SELECT * FROM ${comments_table} WHERE ${query}`;
    let [err, res] = await db.query2(sql, values);
    if(err)return [err];
    return [undefined, res];
}

QuestionComment.update_comment = async (comment, c_id) => {
    let query = `UPDATE ${comments_table} SET ? WHERE id = ?`;
    let [err, res] = await db.query2(query, [comment, c_id]);
    if(err)return [err];
    return [undefined, true];
}

QuestionComment.delete_comment = async (c_id) => {
    let query = `DELETE FROM ${comments_table} WHERE id = ?`;
    let [err, res] = await db.query2(query, [c_id]);
    if(err)return [err];
    return [undefined, true];
}

module.exports = QuestionComment;