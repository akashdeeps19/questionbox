const express = require("express");
const bodyParser = require("body-parser");

const authentication_routes = require("./routes/auth");
const users_routes = require("./routes/users");
const questions_routes = require("./routes/questions");
const question_comments_routes = require("./routes/question_comments");
const answers_routes = require("./routes/answers");
const answer_comments_routes = require("./routes/answer_comments");

require("./config/database_config");

const app = express();

const port = process.env.PORT || 3000;
app.listen(port,()=>console.log(`listening at ${port}`));

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use("/auth", authentication_routes);
app.use("/users", users_routes);
app.use("/questions", questions_routes);
app.use("/questioncomments", question_comments_routes);
app.use("/answers", answers_routes);
app.use("/answercomments", answer_comments_routes);
