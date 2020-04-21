const express = require("express");
const router = express.Router();
const User = require("../models/user");
const bcrypt = require("bcrypt");
const check_auth = require("../middleware/check_auth");
const jwt = require("jsonwebtoken");
const jwt_key = require("../jwt_key");


router.post("/signup", (req, res) => {
    bcrypt.hash(req.body.password, 10, (err, hash) => {
        if (err) {
            return res.status(500).json({
                error: err
            });
        } else {
            User.findOrCreate({
                where: { name: req.body.name },
                defaults: { password: hash, bio: req.body.bio }
            }).then((user, created) => {
                console.log(created);
                if (created) {
                    res.status(201).json({
                        message: "User created"
                    });
                } else {
                    res.status(409).json({
                        message: "Username already exists"
                    });
                }
            }).catch(err=>
                res.status(409).json({
                    error: err
                })
            );
        }
    });
});

router.post("/login", (req, res, next) => {
    User.findAll({
        where: {
            name: req.body.name
        }
    }).then(user=>{
        if(user.length < 1) {
            return res.status(401).json({
                message: "Auth failed"
            });
        }

        bcrypt.compare(
            req.body.password,
            user[0].password,
            (err, result) => {
                if (err) {
                    return res.status(401).json({
                        message: "Auth failed"
                    });
                }
                if (result) {
                    const token = jwt.sign(
                        {
                            name: user[0].name,
                            id: user[0].id
                        },
                        jwt_key,
                        {
                            expiresIn: "1h"
                        }
                    );
                    return res.status(200).json({
                        message: "Auth successful",
                        token: token,
                    });
                }
                res.status(401).json({
                    message: "Auth failed"
                });
            }
        );
        });
});

router.delete("/", check_auth, (req, res, next) => {
    User.destroy({
        where: {
            id: req.userData.id
        }
    })
    .then(result => {
        res.status(200).json({
            message: "User deleted"
        });
    })
    .catch(err => {
        console.log(err);
        res.status(500).json({
            error: err
        });
    });
});


module.exports = router;