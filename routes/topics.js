const express = require("express");
const Topic = require("../services/topics.services");
const Question = require("../services/questions.services");
const check_auth = require("../middleware/check_auth");

const router = express.Router();

router.post("/", check_auth, async (req, res) => {
    const topic = {
        name : req.body.name
    }
    const [error, res1] = await Topic.post_topic(topic);
    if(error)return res.status(400).json({error});
    res.status(200).json({topic_id : res1});
});

router.get("/", async (req, res) => {
    const [error, res1] = await Topic.get_topics();
    if(error)return res.status(400).json({error});
    res.status(200).json({topics : res1});
});

router.get("/:t_id", async (req, res) => {
    const [error, res1] = await Topic.get_topic('id = ?', [req.params.t_id]);
    if(error)return res.status(400).json({error});
    res.status(200).json({topic : res1});
});

router.patch("/:t_id", check_auth, async (req, res) => {
    const topic = {name : req.body.name};
    const [error, res1] = await Topic.update_topic(topic,req.params.t_id);
    if(error)return res.status(400).json({error});
    res.status(200).json({message : "topic updated"});
});

router.delete("/:t_id", check_auth, async (req, res) => {
    const [error, res2] = await Topic.delete_topic(req.params.t_id);
    if(error)return res.status(400).json({error});
    res.status(200).json({message : "topic deleted"});
});

router.get("/:t_id/questions", async (req, res) => {
    const [error, res1] = await Topic.get_topicquestions(req.params.t_id);
    if(error)return res.status(400).json({error});
    res.status(200).json({questions : res1});
});

router.post("/question/:q_id", check_auth, (req, res) => {
    Question.get_question(req.params.q_id)
	.then(async (question) => {
        if(question[0].asked_by_id != req.user.id)
            return res.status(403).json({message : "Not permitted to add"});

        const [error, res2] = await Topic.add_questiontopic(req.body.topic_id,req.params.q_id);
        if(error)return res.status(400).json({error});
        res.status(200).json({message : "Added topic to question"});
    })
	.catch(err=>res.status(501).json({error : err}));
});

router.get("/question/:q_id", async (req, res) => {
    const [error, res1] = await Topic.get_questiontopics(req.params.q_id);
    if(error)return res.status(400).json({error});
    res.status(200).json({topics : res1});
});

router.delete("/question/:q_id", check_auth, (req, res) => {
    Question.get_question(req.params.q_id)
	.then(async (question) => {
        if(question[0].asked_by_id != req.user.id)
            return res.status(403).json({message : "Not permitted to delete"});
        const [error, res2] = await Topic.delete_questiontopic(req.body.topic_id, req.params.q_id);
        if(error)return res.status(400).json({error});
        res.status(200).json({message : "topic deleted from question"});
    })
	.catch(err=>res.status(501).json({error : err}));
});

module.exports = router;