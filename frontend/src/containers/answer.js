import React, { Component } from 'react';
import { connect } from 'react-redux';
import '../App.css';
import { changeAnswer } from '../actions/answers';
import AnswerCard from '../components/answercard'
import Comment from '../components/comment';


class Answer extends Component {
  
  shouldComponentUpdate(nextProps, nextState) {
    return nextProps.answer.count !== this.props.answer.count 
  }

  upVote = () => {
    const { questionId, changeAnswer, answer } = this.props
    console.log(answer)
    localStorage.setItem('rating',6)
localStorage.setItem('rating',6)
document.querySelector('.results').innerHTML = '6';
    /*const updatedAnswer = Object.assign( {}, answer, { count: answer.count + 1 })
    changeAnswer(questionId, updatedAnswer) */
  }

  downVote = event => {
	localStorage.setItem('rating',6)
document.querySelector('.results').innerHTML = '4';
  
    const { questionId, changeAnswer, answer } = this.props
    /*const updatedAnswer = Object.assign( {}, answer, { count: answer.count - 1 })
    changeAnswer(questionId, updatedAnswer) */
  }

  render() {
localStorage.setItem('rating',5)
   return (
        <div className="mybox">
          <AnswerCard rating={+5} upvoter={this.upVote} downvoter={this.downVote} content={this.props.answer.answer} comment={"That was very helpful,thanks!"} />
          <br/>
          <Comment/>
        </div>
    );

    /*return (
        <div>
          <p>this.props.answer.answer</p>
		<p>Helpfullness rating :</p>
		<div className="results">5</div>
          <p className="rating" id='demo'>Score: {localStorage.getItem('rating')}</p>

          <button onClick="function() {
            document.getElementById('demo').innerHTML = '6';}">Upvote</button>

          <button onClick="this.downVote()">Downvote</button>
          <p> Comments </p>
          <p> Thanks!This was very helpfull! </p>
          <form>
          <label for="commentbox">Add your own comment:</label>
          <textarea id="commentbox" name="commentbox" rows="4" cols="25"></textarea>
          <br/><br/>
          <input type="submit" value="Submit">
          </form>
        </div>
    );*/
  }
}

export default connect(null, { changeAnswer })(Answer);

