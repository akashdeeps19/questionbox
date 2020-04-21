const express = require("express"),
    app = express();

const bodyParser = require("body-parser");

const authentication_routes = require("./routes/auth");
const users_routes = require("./routes/users");
    // question_routes = require("./routes/question");

require("./config/database_config");

const port = process.env.PORT || 3000;
app.listen(port,()=>console.log(`listening at ${port}`));

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use("/auth", authentication_routes);
app.use("/users", users_routes);
// app.use("/questions", question_routes);
