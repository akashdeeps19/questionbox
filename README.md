# questionbox
Api for web app similar to stackoverflow
### Setup
1.) Import the questionbox.sql file into appropriate MySql database<br/><br/>
2.) Configure credentials in ./config/database_config<br/><br/>
3.) Start server using $ npm start<br/><br/>
4.) Succes messages-<br/><br/>
   listening at 3000<br/><br/>
   Connected to the MySQL server

### Api endpoints
POST	/auth/signup    BODY {user_name, first_name, last_name, email, user_password, bio}<br/><br/>
POST	/auth/login     BODY {user_name,password}<br/><br/>
GET	/users/:name<br/><br/>
GET	/users/id/:id<br/><br/>
PATCH	/users/update      BODY any of these fields {user_name, first_name, last_name, email, bio}<br/><br/>
PATCH	/users/resetpassword   BODY {password}<br/><br/>
DELETE	/users/delete<br/><br/>
GET	/users/:id/follow<br/><br/>
POST	/users/:id/follow<br/><br/>
POST	/users/:id/unfollow<br/><br/>
GET	/users/:id/followers<br/><br/>
GET	/users/:id/following<br/><br/>
POST	/questions/add      BODY {question, topics : [topic_id1, topic_id2, ...]}<br/><br/>
GET	/questions/all<br/><br/>
GET	/questions/:id<br/><br/>
GET	/questions/:id/upvoted<br/><br/>
POST	/questions/:id/upvote<br/><br/>
GET	/questions/:q_id/downvoted<br/><br/>
POST	/questions/:q_id/downvote<br/><br/>
PATCH	/questions/:id         BODY {question}<br/><br/>
DELETE	/questions/:id<br/><br/>
GET	/questions/:q_id/follow<br/><br/>
POST	/questions/:q_id/follow<br/><br/>
POST	/questions/:q_id/unfollow<br/><br/>
GET	/questions/:q_id/followers<br/><br/>
GET	/questions/user/following<br/><br/>
POST	/topics         BODY {name}<br/><br/>
GET	/topics<br/><br/>
GET	/topics/:t_id<br/><br/>
PATCH	/topics/:t_id      BODY {name}<br/><br/>
DELETE	/topics/:t_id<br/><br/>
GET	/topics/:t_id/questions<br/><br/>
POST	/topics/question/:q_id      BODY {topic_id}<br/><br/>
GET	/topics/question/:q_id<br/><br/>
DELETE	/topics/question/:q_id<br/><br/>
GET	/topics/:t_id/follow<br/><br/>
POST	/topics/:t_id/follow<br/><br/>
POST	/topics/:t_id/unfollow<br/><br/>
GET	/topics/:t_id/followers<br/><br/>
GET	/topics/user/following<br/><br/>
POST	/questioncomments/question/:q_id    BODY {comment}<br/><br/>
GET	/questioncomments/:c_id<br/><br/>
GET	/questioncomments/question/:q_id<br/><br/>
PATCH	/questioncomments/:c_id        BODY {comment}<br/><br/>
DELETE	/questioncomments/:c_id<br/><br/>
GET	/answers/question/:q_id<br/><br/>
GET	/answers/:a_id<br/><br/>
POST	/answers/question/:q_id         BODY {answer}<br/><br/>
GET	/answers/:a_id/upvoted<br/><br/>
POST	/answers/:a_id/upvote<br/><br/>
GET	/answers/:a_id/downvoted<br/><br/>
POST	/answers/:a_id/downvote<br/><br/>
PATCH	/answers/:a_id         BODY {answer}<br/><br/>
DELETE	/answers/:a_id<br/><br/>
POST	/answercomments/answer/:a_id       BODY {comment}<br/><br/>
GET	/answercomments/:c_id<br/><br/>
GET	/answercomments/answer/:a_id<br/><br/>
PATCH	/answercomments/:c_id      BODY {comment}<br/><br/>
DELETE	/answercomments/:c_id
