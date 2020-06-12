import React, { Component } from 'react';
import { connect } from 'react-redux';
import CreateAnswer from './createAnswer'
import {Redirect} from 'react-router-dom';
import QuestionCard from '../components/QuestionCard'

import { getQuestion } from '../actions/questions'
import { deleteQuestion } from '../actions/questions'
import { getAnswers } from '../actions/answers'
const API_URL='http://192.168.1.7:3000'

class Question extends Component {

  constructor(props) {
    super(props);
    this.state = [];
    var json;
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
   
    // console.log("answers")
    // console.log(ans)
    console.log("updated",this.props)
    var ques = {topics:this.props["topics"],id:this.props["id"] , question:this.props["question"] , asked_by_id:this.props["asked_by_id"], downvotes:this.props["downvotes"], upvotes:this.props["upvotes"] , answers:this.props["answers"] }
    console.log("the answers are  is"+ques.answers)
    return (
        <div>
        { question ?
        <div>
        <div  style={{border: '7px solid red'}}>
          <QuestionCard question={ques} />
        </div>
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
      console.log("thing"+ state.questions["questions"][i][0]["id"]);
      if (state.questions["questions"][i][0]["id"]===+ownProps.match.params.questionId)
      {
        console.log("returning"+state.questions["questions"][i][0] );
        return state.questions["questions"][i][0];
      }
    }
    console.log("returned nothing");
  
  // return {
  //   question: state.questions.find(question => question.id === +ownProps.match.params.questionId)

  // }
} 


export default connect(mapStateToProps, { deleteQuestion, getAnswers })(Question);
