const express = require("express");
const Answer = require("../services/answers.services");
const check_auth = require("../middleware/check_auth");

const router = express.Router();

router.get("/question/:q_id", (req,res) => {
    Answer.get_answers(req.params.q_id)
    .then(answers => res.json(answers))
    .catch(error => res.status(500).json({error}));
});

router.get("/:a_id", (req, res) => {
    Answer.get_answer(`id = ?`, [req.params.a_id])
    .then(answer => res.json(answer[0]))
    .catch(error => res.status(500).json({error}));
})

router.post("/question/:q_id", check_auth, async (req,res) => {
    const answer = {
        answer : req.body.answer,
        user_id : req.user.id,
        question_id : req.params.q_id
    }
    const [error, res1] = await Answer.get_answer2(`question_id = ? and user_id = ?`,[answer.question_id,answer.user_id])
    if(error)res.status(400).json({error})
    if(res1.length != 0)return res.status(200).json({message : "You have already answered this question"})
    const [err2, res2] = await Answer.post_answer(answer);
    if(error)return res.status(400).json({error : err2});
    res.status(200).json({answer_id : res2});
});

router.get("/:a_id/upvoted", check_auth, async (req, res) => {
    const [error, res1] = await Answer.get_upvote(req.params.a_id,req.user.id);
    if(error)res.status(400).json({error});
    res.json({upvoted : res1});
});

router.post("/:a_id/upvote", check_auth, async (req, res) => {
    const [error, res1] = await Answer.get_upvote(req.params.a_id,req.user.id);
    if(error)res.status(400).json({error});
    if(!res1){
        const [error, res2] = await Answer.upvote(req.params.a_id,req.user.id);
        if(error)res.status(400).json({error});
        res.status(200).json({message : "upvoted"})
    }
    else{
        const [error, res3] = await Answer.upvote_cancel(req.params.a_id,req.user.id);
        if(error)res.status(400).json({error});
        res.status(200).json({message : "upvote cancelled"})
    }
});

router.get("/:a_id/downvoted", check_auth, async (req, res) => {
    const [error, res1] = await Answer.get_downvote(req.params.a_id,req.user.id);
    if(error)return res.status(400).json({error});
    res.json({downvoted : res1});
});

router.post("/:a_id/downvote", check_auth, async (req, res) => {
    const [error, res1] = await Answer.get_downvote(req.params.a_id,req.user.id);
    if(error)return res.status(400).json({error});
    if(!res1){
        const [error, res2] = await Answer.downvote(req.params.a_id,req.user.id);
        if(error)res.status(400).json({error});
        res.status(200).json({message : "downvoted"})
    }
    else{
        const [error, res3] = await Answer.downvote_cancel(req.params.a_id,req.user.id);
        if(error)res.status(400).json({error});
        res.status(200).json({message : "downvote cancelled"})
    }
});

router.patch("/:a_id", check_auth, async (req, res) => {
    const [error, res1] = await Answer.get_answer2('id = ?',[req.params.a_id]);
    if(error)return res.status(400).json({error});
    if(res1.length > 0 && res1[0].user_id != req.user.id)return res.status(403).json({message : "Not permitted to edit"});
    const answer = {answer : req.body.answer};
    const [err2, res2] = await Answer.update_answer(answer,req.params.a_id);
    if(err2)return res.status(400).json({error : err2});
    res.status(200).json({message : "answer updated"})
});

router.delete("/:a_id", check_auth, async (req, res) => {
    const [error, res1] = await Answer.get_answer2('id = ?',[req.params.a_id]);
    if(error)return res.status(400).json({error});
    if(res1.length > 0 && res1[0].user_id != req.user.id)return res.status(403).json({message : "Not permitted to delete"});
    const [err2, res2] = await Answer.delete_answer(req.params.a_id);
    if(err2)return res.status(400).json({error : err2});
    res.status(200).json({message : "answer deleted"})
});

module.exports = router;