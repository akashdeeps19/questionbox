const express = require("express");
const User = require("../controllers/users.controller");
const check_auth = require("../middleware/check_auth");

const router = express.Router();


router.get("/",check_auth,(req,res) => {
    User.get_user(req.user.name)
    .then(result => {
        res.json(result);
    })
    .catch(err => res.status(401).json({message : err}));
});

// router.delete("/", check_auth, (req, res, next) => {
//     User.destroy({
//         where: {
//             id: req.userData.id
//         }
//     })
//     .then(result => {
//         res.status(200).json({
//             message: "User deleted"
//         });
//     })
//     .catch(err => {
//         console.log(err);
//         res.status(500).json({
//             error: err
//         });
//     });
// });

module.exports = router;