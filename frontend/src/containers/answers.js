import React, { Component } from 'react';
import { connect } from 'react-redux';
import { getAnswers } from '../actions/answers'
import Answer from './answer'
import axios from 'axios';
import { getQuestions } from '../actions/questions'
const API_URL='http://192.168.1.7:3000'

class Answers extends Component {

render() {
  var { question } = this.props
  question.answers= [
    {
        "id": 3,
        "answer": "House",
        "views": 0,
        "answered_on": "2020-05-31T08:37:59.000Z",
        "question_id": 5,
        "user_id": 15,
        "upvotes": 0,
        "downvotes": 0
    }
]
  // console.log("something")
return (
  <div>
      { question ? question.answers.sort(function(a,b) 
        { return (a.count < b.count) ? 1 : ((b.count > a.count) ? -1 : 0)} 
          ).map(answer =>  
            <Answer key={answer.id} answer={answer} questionId={question.id} />
          ) : 
        <p>Loading...</p>
        }
  </div>  
    );
  }    
}


export default connect(null, { getAnswers, getQuestions })(Answers);
