const express = require("express");
const QuestionComment = require("../services/question_comments.services");
const check_auth = require("../middleware/check_auth");

const router = express.Router();

router.post("/question/:q_id", check_auth, async (req, res) => {
    const comment = {
        comment : req.body.comment,
        user_id : req.user.id,
        question_id : req.params.q_id
    }
    const [error, res1] = await QuestionComment.post_comment(comment);
    if(error)return res.status(400).json({error});
    res.status(200).json({comment_id : res1});
});

router.get("/:c_id", async (req, res) => {
    const [error, res1] = await QuestionComment.get_comment('id = ?', [req.params.c_id]);
    if(error)return res.status(400).json({error});
    res.status(200).json({comment : res1});
});

router.get("/question/:q_id", async (req, res) => {
    const [error, res1] = await QuestionComment.get_comment('question_id = ?', [req.params.q_id]);
    if(error)return res.status(400).json({error});
    res.status(200).json({comments : res1});
});

router.patch("/:c_id", check_auth, async (req, res) => {
    const [error, res1] = await QuestionComment.get_comment('id = ?',[req.params.c_id]);
    if(error)return res.status(400).json({error});
    if(res1.length > 0 && res1[0].user_id != req.user.id)return res.status(403).json({message : "Not permitted to edit"});
    const comment = {comment : req.body.comment};
    const [err2, res2] = await QuestionComment.update_comment(comment,req.params.c_id);
    if(err2)return res.status(400).json({error : err2});
    res.status(200).json({message : "comment updated"});
});

router.delete("/:c_id", check_auth, async (req, res) => {
    const [error, res1] = await QuestionComment.get_comment('id = ?',[req.params.c_id]);
    if(error)return res.status(400).json({error});
    if(res1.length > 0 && res1[0].user_id != req.user.id)return res.status(403).json({message : "Not permitted to delete"});
    const [err2, res2] = await QuestionComment.delete_comment(req.params.c_id);
    if(err2)return res.status(400).json({error : err2});
    res.status(200).json({message : "comment deleted"});
});

module.exports = router;