const jwt = require("jsonwebtoken");
const jwt_key = require("../config/jwt_key")
var express = require('express');
// Import the library:
var cors = require('cors');

var app = express();

// Then use it before your routes are set up:
app.use(cors());
module.exports = (req, res, next) => {
    const token = req.headers.authorization && req.headers.authorization.split(" ")[1];
    jwt.verify(token, jwt_key, (err,user)=>{
        if(err)
            return res.status(403).json({
                message: err.message
            });
        req.user = user;
        next();
    });   
};
