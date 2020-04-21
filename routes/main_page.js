const express = require("express");
const router = express.Router();
const db = require("../config/database");
const Gig = require("../models/user");

router.post("", (req, res, next) => {
  Gig.findAll()
    .then(gigs123 => console.log(gigs123))
    .catch(err => console.log(err));
  res.status(200).json({
    message: "Hello"
  });
});

module.exports = router;
