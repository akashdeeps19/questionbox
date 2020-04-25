const express = require("express");
const User = require("../services/users.services");
const check_auth = require("../middleware/check_auth");
const bcrypt = require("bcrypt");
const router = express.Router();

router.get("/:name",(req,res) => {
    User.get_user('user_name', req.params.name)
    .then(user => {
        if(user.length == 0)
            return res.status(404).json({
                message: "No such user"
            });
            
        user = user[0];
        res.json(user);
    })
    .catch(err => res.status(401).json({message : err}));
});

router.get("/id/:id", (req,res) => {
    User.get_user('id', req.params.id)
    .then(user => {
        if(user.length == 0)
            return res.status(404).json({
                message: "No such user"
            });
            
        user = user[0];
        res.json(user);
    })
    .catch(err => res.status(401).json({message : err}));
});

router.patch("/update",check_auth,(req,res) => {
    user = {};
    ['bio','user_name'].forEach(key =>  {
        if(key in req.body)user[key] = req.body[key];
    });

    User.update_user(user,req.user.id)
    .then(
        res.status(202).json({message : "User updated"})
    )
    .catch(err => res.status(401).json({message : err}));
});

router.patch("/resetpassword", check_auth, async (req,res) => {
    let password = await bcrypt.hash(req.body.password, 10);

    User.update_user_password(password,req.user.id)
    .then(
        res.status(202).json({message : "Password updated"})
    )
    .catch(err => res.status(401).json({message : err}));
});

router.delete("/delete", check_auth, (req, res, next) => {
    User.delete_user(req.user.id)
    .then(
        res.status(200).json({
            message: "User deleted"
        })
    )
    .catch(err => {
        res.status(500).json({
            error: err
        });
    });
});

router.get("/:id/follow", check_auth, async (req, res) => {
    let [error, res1] = await User.is_following(req.user.id, req.params.id);
    if(error)return res.status(401).json({error});
    res.json({following : res1});
});

router.post("/:id/follow", check_auth, async (req, res) => {
    let [error, res1] = await User.follow(req.user.id, req.params.id);
    if(error)return res.status(401).json({error});
    res.json({message : "following"});
});

router.post("/:id/unfollow", check_auth, async (req, res) => {
    let [error, res1] = await User.unfollow(req.user.id, req.params.id);
    if(error)return res.status(401).json({error});
    res.json({message : "unfollowed"});
});

router.get("/:id/followers", async (req, res) => {
    let [error, res1] = await User.get_followers(req.params.id);
    if(error)return res.status(401).json({error});
    res.json({followers : res1});
});

router.get("/:id/following", async (req, res) => {
    let [error, res1] = await User.get_following(req.params.id);
    if(error)return res.status(401).json({error});
    res.json({following : res1});
});

module.exports = router;