const express = require("express");
const User = require("../services/users.services");
const bcrypt = require("bcrypt");
const check_auth = require("../middleware/check_auth");
const jwt = require("jsonwebtoken");
const jwt_key = require("../config/jwt_key")

const router = express.Router();

// Object {user_name: "S", first_name: "SD", last_name: "Rd", email: "s@g.com", password: "123"…}
router.post("/signup", (req, res) => {
    // console.log("This is the username"+req.body.user_name)
    bcrypt.hash(req.body.password, 10, (err, hash) => {
        if (err)
            return res.status(500).json({error: err});

        user = {user_name : req.body.user_name,
                first_name : req.body.first_name,
                last_name : req.body.last_name,
                email : req.body.email,
                user_password : hash,
                bio : req.body.bio};

        User.add_user(user)
        .then((response) => {
            res.status(201).json({
                message: "User created",
            });
        })
        .catch(err => res.status(409).json({error: err}));
    });
});

router.post("/login", (req, res, next) => {
    User.get_user('user_name', req.body.user_name)
    .then(user => {
        if(user.length == 0)
            return res.status(401).json({
                message: "Auth failed"
            });

        bcrypt.compare(req.body.password,user[0].user_password,(err, result) => {
            if(err)
                return res.status(401).json({
                    message: "Auth failed"
                });
            if(!result)
                return res.status(403).json({
                    message: "Auth failed"
                });
            const token = jwt.sign({name : user[0].user_name,id : user[0].id}, jwt_key, {expiresIn: "1h"});
            return res.status(200).json({
                message: "Auth successful",
                token: token,
            });
        });
    })
    .catch(err => res.status(401).json({message : err}));
});

//logout??

module.exports = router;