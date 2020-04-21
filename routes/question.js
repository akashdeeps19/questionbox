const express = require("express");
const router = express.Router();
const Question = require("../models/question");
const check_auth = require("../middleware/check_auth");

router.post("/add", check_auth, (req, res) => {
	console.log(req.userData);
	Question.create({
		question: req.body.question,
		asked_by_id: req.userData.id, 
		topic_id: req.body.topicId,
		views: 0
	})
	.then((question) => {
		console.log(question);
		res.status(201).json({
			message: "Question created",
			questionID: question.id
		});
			
	})
	.catch(err=>
		console.log(err)
	);
});

router.get("/all", (req, res, next) => {
	Question.findAll()
	.then(questions => {
        res.status(200).json({
			questions: questions
		})
    });
});


router.delete("/:questionId", check_auth, (req, res, next) => {
	Question.findAll({
        where: {
            id: req.params.questionId
        }
    })
    .then(question => {
		if (question[0].asked_by_id == req.userData.id){
			question[0].destroy()
			.then(result => {
				res.status(200).json({
					message: "Question deleted"
				});
			})
			.catch(err => {
				console.log(err);
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
		console.log(err);
		res.status(500).json({
			error: err
		});
	});
});

module.exports = router;
