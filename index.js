const express = require("express");
const bodyParser = require("body-parser");

const authentication_routes = require("./routes/auth");
const users_routes = require("./routes/users");
const questions_routes = require("./routes/questions");
const topics_routes = require("./routes/topics")
const question_comments_routes = require("./routes/question_comments");
const answers_routes = require("./routes/answers");
const answer_comments_routes = require("./routes/answer_comments");
const cors = require('cors');
require("./config/database_config");

const app = express();

const port = process.env.PORT || 3000;
app.listen(port,()=>console.log(`listening at ${port}`));

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors())
app.use("/auth", authentication_routes);
app.use("/users", users_routes);
app.use("/questions", questions_routes);
app.use("/topics", topics_routes);
app.use("/questioncomments", question_comments_routes);
app.use("/answers", answers_routes);
app.use("/answercomments", answer_comments_routes);

// let endpoints = [];

// function print (path, layer) {
//     if (layer.route) {
//       layer.route.stack.forEach(print.bind(null, path.concat(split(layer.route.path))))
//     } else if (layer.name === 'router' && layer.handle.stack) {
//       layer.handle.stack.forEach(print.bind(null, path.concat(split(layer.regexp))))
//     } else if (layer.method) {
//         let route = layer.method.toUpperCase() + '/' + path.concat(split(layer.regexp)).filter(Boolean).join('/');
//         if(!endpoints.includes(route))endpoints.push(route);
//     }
//   }
  
//   function split (thing) {
//     if (typeof thing === 'string') {
//       return thing.split('/')
//     } else if (thing.fast_slash) {
//       return ''
//     } else {
//       var match = thing.toString()
//         .replace('\\/?', '')
//         .replace('(?=\\/|$)', '$')
//         .match(/^\/\^((?:\\[.*+?^${}()|[\]\\\/]|[^.*+?^${}()|[\]\\\/])*)\$\//)
//       return match
//         ? match[1].replace(/\\(.)/g, '$1').split('/')
//         : '<complex:' + thing.toString() + '>'
//     }
//   }
  
//   app._router.stack.forEach(print.bind(null, []))

//   endpoints.forEach(r => console.log(r))
  
  
