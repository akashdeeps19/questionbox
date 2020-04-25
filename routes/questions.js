const express = require("express");
const Question = require("../services/questions.services");
const check_auth = require("../middleware/check_auth");

const router = express.Router();

router.post("/add", check_auth, (req, res) => {
	Question.add_question({
		question: req.body.question,
		asked_by_id: req.user.id, 
		topic_name: req.body.topic,
		views: 0
	})
	.then((question) => {
		res.status(201).json({
			message: "Question created",
			questionID: question
		});		
	})
	.catch(err=>res.status(401).json({error : err}));
});

router.get("/all", (req, res, next) => {
	Question.get_all_questions()
	.then(questions => {
        res.status(200).json({
			questions: questions
		})
	})
	.catch(err=>res.status(501).json({error : err}));
});


router.get("/:id", (req, res, next) => {
	Question.get_question(req.params.id)
	.then(question => res.status(200).json({question}))
	.catch(err=>res.status(501).json({error : err}));
});

router.get("/:id/upvoted", check_auth, (req,res) => {
	Question.get_upvote(req.params.id, req.user.id)
	.then(upvoted => res.json({upvoted}))
	.catch(err => res.status(501).json({message : err}));
})

router.post("/:id/upvote", check_auth, (req,res) => {
	Question.toggle_upvote(req.params.id,req.user.id)
	.then(upvoted => {
		if(upvoted)
			res.status(200).json({message : "upvoted"})
		else
			res.status(200).json({message : "upvote cancelled"})
		})
	.catch(err => res.status(501).json({error : err}));
});

router.get("/:q_id/downvoted", check_auth, async (req, res) => {
    const [error, res1] = await Question.get_downvote(req.params.q_id,req.user.id);
    if(error)return res.status(400).json({error});
    res.json({downvoted : res1});
});

router.post("/:q_id/downvote", check_auth, async (req, res) => {
    const [error, res1] = await Question.get_downvote(req.params.q_id,req.user.id);
    if(error)return res.status(400).json({error});
    if(!res1){
        const [error, res2] = await Question.downvote(req.params.q_id,req.user.id);
        if(error)return res.status(400).json({error});
        res.status(200).json({message : "downvoted"})
    }
    else{
        const [error, res3] = await Question.downvote_cancel(req.params.q_id,req.user.id);
        if(error)return res.status(400).json({error});
        res.status(200).json({message : "downvote cancelled"})
    }
});

router.patch("/:id", check_auth, (req,res) => {
	question_updated = {};
    ['question','topic_name'].forEach(key =>  {
        if(key in req.body)question_updated[key] = req.body[key];
	});
	
	Question.get_question(req.params.id)
    .then(question => {
		if (question[0].asked_by_id == req.user.id){
			Question.update_question(question_updated, req.params.id)
			.then(
				res.status(200).json({
					message: "Question updated"
				})
			)
			.catch(err => {
				res.status(500).json({
					error: err
				});
			});
		}
		else{
			res.status(200).json({
				message: "Not permitted to update"
			})
		}
	})
	.catch(err => {
		res.status(500).json({
			error: err
		});
	});
});

router.delete("/:id", check_auth, (req, res, next) => {
	Question.get_question(req.params.id)
    .then(question => {
		if (question[0].asked_by_id == req.user.id){
			Question.delete_question(req.params.id)
			.then(
				res.status(200).json({
					message: "Question deleted"
				})
			)
			.catch(err => {
				res.status(500).json({
					error: err
				});
			});
		}
		else{
			res.status(200).json({
				message: "Not permitted to delete"
			})
		}
	})
	.catch(err => {
		res.status(500).json({
			error: err
		});
	});
});

router.get("/:q_id/follow", check_auth, async (req, res) => {
    let [error, res1] = await Question.is_following(req.user.id,req.params.q_id);
    if(error)return res.status(401).json({error});
    res.json({following : res1});
});

router.post("/:q_id/follow", check_auth, async (req, res) => {
    let [error, res1] = await Question.follow(req.user.id, req.params.q_id);
    if(error)return res.status(401).json({error});
    res.json({message : "following"});
});

router.post("/:q_id/unfollow", check_auth, async (req, res) => {
    let [error, res1] = await Question.unfollow(req.user.id, req.params.q_id);
    if(error)return res.status(401).json({error});
    res.json({message : "unfollowed"});
});

router.get("/:q_id/followers", async (req, res) => {
    let [error, res1] = await Question.get_followers(req.params.q_id);
    if(error)return res.status(401).json({error});
    res.json({followers : res1});
});

router.get("/user/following", check_auth, async (req, res) => {
    let [error, res1] = await Question.get_following(req.user.id);
    if(error)return res.status(401).json({error});
    res.json({following : res1});
});

module.exports = router;
