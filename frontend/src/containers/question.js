import React, { Component } from 'react';
import { connect } from 'react-redux';
import CreateAnswer from './createAnswer'
import {Redirect} from 'react-router-dom';
import QuestionCard from '../components/QuestionCard'

import { getQuestion } from '../actions/questions'
import { deleteQuestion } from '../actions/questions'
import { getAnswers } from '../actions/answers'


class Question extends Component {

  constructor(props) {
    super(props);
    this.state = {
    }
    this.handleDelete = this.handleDelete.bind(this)
  }

  shouldComponentUpdate(nextProps, nextState) {
    return true
  }

  handleDelete = () => {
    const { question } = this.props
    const { history } = this.props
    this.props.deleteQuestion(question.id, history);
  }

  render() {
    const { question } = this.props
    console.log(this.props)
    var ques = {id:this.props["id"] , question:this.props["question"] , asked_by_id:this.props["asked_by_id"], downvotes:this.props["downvotes"], upvotes:this.props["upvotes"], question:this.props["question"]}
    console.log("the question is"+ques)
    return (
        <div>
        { question ?
        <div>
          <QuestionCard question={ques} />
          <button onClick={this.handleDelete}>Delete</button>
          <CreateAnswer question={ques} />
        </div>
        : "Loading" 
        }
        </div>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  console.log(state.questions["questions"])
  
    for(var i=0;i<state.questions["questions"].length;i++)
    {
      console.log("thing"+ state.questions["questions"][i]["id"]);
      if (state.questions["questions"][i]["id"]===+ownProps.match.params.questionId)
      {
        console.log("returning"+state.questions["questions"][i] );
        return state.questions["questions"][i];
      }
    }
    console.log("returned nothing");
  
  // return {
  //   question: state.questions.find(question => question.id === +ownProps.match.params.questionId)

  // }
} 


export default connect(mapStateToProps, { deleteQuestion, getAnswers })(Question);
