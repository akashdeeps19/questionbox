import React, { Component } from 'react';
import { connect } from 'react-redux';
import '../App.css';
import { changeAnswer } from '../actions/answers';
import AnswerCard from '../components/answercard'


class Answer extends Component {
  
  shouldComponentUpdate(nextProps, nextState) {
    return nextProps.answer.count !== this.props.answer.count 
  }

  upVote = () => {
    const { questionId, changeAnswer, answer } = this.props
    const updatedAnswer = Object.assign( {}, answer, { count: answer.count + 1 })
    changeAnswer(questionId, updatedAnswer) 
  }

  downVote = event => {
    const { questionId, changeAnswer, answer } = this.props
    const updatedAnswer = Object.assign( {}, answer, { count: answer.count - 1 })
    changeAnswer(questionId, updatedAnswer) 
  }

  render() {
    return (
        <div className="mybox">
          <AnswerCard rating={0} upvoter={0} downvoter={0} content={this.props.answer.answer} />
        </div>
    );
  }
}

export default connect(null, { changeAnswer })(Answer);

