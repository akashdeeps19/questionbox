const jwt = require("jsonwebtoken");
require('dotenv').config()
const jwt_key = process.env.JWT_KEY


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
