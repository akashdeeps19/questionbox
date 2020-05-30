import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom'

import { getQuestions } from '../actions/questions'

class Questions extends Component {

    shouldComponentUpdate(nextProps, nextState) {
      if (nextProps.questions.length != this.props.questions.length) {
        return true
      } else {
        return false
      }
    }

  render() {
    console.log("trying")
    // const renderQuestions = this.props.questions;
    var renderQuestions = [];
    // console.log(this.props.questions);
    // console.log((this.props.questions["questions"])[0]["id"])
    // for( var q in this.props.questions){console.log(q)}
    
    console.log(this.props.questions["questions"].length)
    for (var i = 0; i < this.props.questions["questions"].length; i++){
      var the_question = this.props.questions["questions"][i]["question"];
      renderQuestions.push(<Link key={(this.props.questions["questions"])[i]["id"]} to={`/questions/${(this.props.questions["questions"])[i]["id"]}`}><h4>{the_question}</h4></Link>);
      }
    // const renderQuestions = this.props.questions.map(question => 
    //   <Link key={question.id} to={`/questions/${question.id}`}><h4>{question.question}</h4></Link>
    // );
    console.log(renderQuestions)
    
    return (

        <div>
          {renderQuestions}
        </div>
    );  
  }  
}

const mapStateToProps = (state) => {
  return ({
    questions: state.questions
  })
}

export default connect(mapStateToProps, { getQuestions })(Questions);
