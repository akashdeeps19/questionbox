# questionbox
Api for web app similar to stackoverflow
### Setup
1.) Import the questionbox.sql file into appropriate MySql database\
2.) Configure credentials in ./config/database_config\
3.) Start server using $ npm start\
4.) Succes messages-\
   listening at 3000\
   Connected to the MySQL server

### Api endpoints
POST	/auth/signup    BODY {user_name, first_name, last_name, email, user_password, bio}\\
POST	/auth/login     BODY {user_name,password}\\
GET	/users/:name\\
GET	/users/id/:id\\
PATCH	/users/update      BODY any of these fields {user_name, first_name, last_name, email, bio}\\
PATCH	/users/resetpassword   BODY {password}\\
DELETE	/users/delete\\
GET	/users/:id/follow\\
POST	/users/:id/follow\\
POST	/users/:id/unfollow\\
GET	/users/:id/followers\\
GET	/users/:id/following\\
POST	/questions/add      BODY {question}\\
GET	/questions/all\\
GET	/questions/:id\\
GET	/questions/:id/upvoted\\
POST	/questions/:id/upvote\\
GET	/questions/:q_id/downvoted\\
POST	/questions/:q_id/downvote\\
PATCH	/questions/:id         BODY {question}\\
DELETE	/questions/:id\\
GET	/questions/:q_id/follow\\
POST	/questions/:q_id/follow\\
POST	/questions/:q_id/unfollow\\
GET	/questions/:q_id/followers\\
GET	/questions/user/following\\
POST	/topics         BODY {name}\\
GET	/topics\\
GET	/topics/:t_id\\
PATCH	/topics/:t_id      BODY {name}\\
DELETE	/topics/:t_id\\
GET	/topics/:t_id/questions\\
POST	/topics/question/:q_id      BODY {topic_id}\\
GET	/topics/question/:q_id\\
DELETE	/topics/question/:q_id\\
GET	/topics/:t_id/follow\\
POST	/topics/:t_id/follow\\
POST	/topics/:t_id/unfollow\\
GET	/topics/:t_id/followers\\
GET	/topics/user/following\\
POST	/questioncomments/question/:q_id    BODY {comment}\\
GET	/questioncomments/:c_id\\
GET	/questioncomments/question/:q_id\\
PATCH	/questioncomments/:c_id        BODY {comment}\\
DELETE	/questioncomments/:c_id\\
GET	/answers/question/:q_id\\
GET	/answers/:a_id\\
POST	/answers/question/:q_id         BODY {answer}\\
GET	/answers/:a_id/upvoted\\
POST	/answers/:a_id/upvote\\
GET	/answers/:a_id/downvoted\\
POST	/answers/:a_id/downvote\\
PATCH	/answers/:a_id         BODY {answer}\\
DELETE	/answers/:a_id\\
POST	/answercomments/answer/:a_id       BODY {comment}\\
GET	/answercomments/:c_id\\
GET	/answercomments/answer/:a_id\\
PATCH	/answercomments/:c_id      BODY {comment}\\
DELETE	/answercomments/:c_id
