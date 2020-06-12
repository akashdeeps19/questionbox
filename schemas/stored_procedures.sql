-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: questionbox
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1
--
-- Dumping routines for database 'questionbox'
--
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `answer_downvote`(id_ int(11))
begin select downvotes into @u from questionbox_answers where id = id_; update questionbox_answers set downvotes = @u + 1 where id= id_; end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `answer_downvote_cancel`(id_ int(11))
begin select downvotes into @u from questionbox_answers where id = id_; update questionbox_answers set downvotes = @u - 1 where id= id_; end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `answer_upvote`(id_ int(11))
begin select upvotes into @u from questionbox_answers where id = id_; update questionbox_answers set upvotes = @u + 1 where id = id_; end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `answer_upvote_cancel`(id_ int(11))
begin select upvotes into @u from questionbox_answers where id = id_; update questionbox_answers set upvotes = @u - 1 where id= id_; end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_following_questions`(u_id int(11))
begin
select qq.* from questionbox_questionfollows qqf, questionbox_questions qq
where qqf.user_id = u_id and qqf.question_id = qq.id;
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_following_topics`(u_id int(11))
begin
select qt.* from questionbox_topicfollows qtf, questionbox_topics qt
where qtf.user_id = u_id and qtf.topic_id = qt.id;
end ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_question`(id_ int(11), inc boolean)
begin
SELECT views into @vw from questionbox_questions where id = id_;
set @vw = if(inc,@vw+1,@vw); update questionbox_questions set views = @vw where id = id_;
select * from questionbox_questions where id = id_;
end ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_question_followers`(q_id int(11))
begin
select qu.* from questionbox_questionfollows qqf, questionbox_appusers qu
where qqf.question_id = q_id and qqf.user_id = qu.id;
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_topic_followers`(t_id int(11))
begin
select qu.* from questionbox_topicfollows qtf, questionbox_appusers qu
where qtf.topic_id = t_id and qtf.user_id = qu.id;
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user`(name varchar(255))
begin select * from questionbox_appusers where user_name like name;end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_followers`(u_id int(11))
begin
select a.* from questionbox_userfollows qu, questionbox_appusers a
where qu.follows_id = u_id and a.id = qu.follower_id;
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_following`(u_id int(11))
begin
select a.* from questionbox_userfollows qu, questionbox_appusers a
where qu.follower_id = u_id and a.id = qu.follows_id;
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `question_downvote`(id_ int(11))
begin select downvotes into @u from questionbox_questions where id = id_; update questionbox_questions set downvotes = @u + 1 where id= id_; end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `question_downvote_cancel`(id_ int(11))
begin select downvotes into @u from questionbox_questions where id = id_; update questionbox_questions set downvotes = @u - 1 where id= id_; end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `question_upvote`(id_ int(11))
begin select upvotes into @u from questionbox_questions where id = id_; update questionbox_questions set upvotes = @u + 1 where id = id_; end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `question_upvote_cancel`(id_ int(11))
begin select upvotes into @u from questionbox_questions where id = id_; update questionbox_questions set upvotes = @u - 1 where id= id_; end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `upvote`(q_id int(11), u_id int(11), table_ varchar(255), upvotes_table varchar(255))
begin select upvotes into @u from table_ where id = q_id; set @u = @u + 1; insert into upvotes_table values(u_id, q_id); update table_ set upvotes = @u where id = q_id; end ;;
DELIMITER ;

-- Dump completed on 2020-04-25 11:59:31

