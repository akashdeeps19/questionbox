import React, { Component } from 'react';
import { connect } from 'react-redux';
import Answers from './answers'
import { createAnswer } from '../actions/answers'

class CreateAnswer extends Component {
  constructor(props) {
    super(props);
    
    this.state = {
      answer: ""
    }
  }

  handleOnChange = event => {
    const { value } = event.target;

    this.setState({
      answer: value
    });
  }

  handleOnSubmit = event => {
    event.preventDefault()
    this.props.createAnswer(this.state, this.props.question.id)
    this.setState({ answer: '' });
  }

  render() {
    console.log("form loaded")
    // console.log(this.props.question);
    var json;
    (async () => {
      const response = await fetch('http://192.168.1.7:3000/answers/question/${this.question["id"]}')
       json = await response.json();
      console.log("the json is"+json);
    })();

    var ques = {answer:json,id:this.props.question["id"] , question:this.props.question["question"] , asked_by_id:this.props.question["asked_by_id"], downvotes:this.props.question["downvotes"], upvotes:this.props.question["upvotes"], question:this.props.question["question"]}
    console.log(ques)

    return (
    <div>
      Enter Your answer below
      <form onSubmit={this.handleOnSubmit}>
        <div>
          <textarea
            name="content"
            value={this.state.answer}
            onChange={this.handleOnChange}
          >
          </textarea>
        </div>
        <div>
          <button type="submit">Add Answer</button>
        </div>
      </form>
      <Answers question={ques} />
    </div>
    );
  }
}

export default connect(null, {createAnswer})(CreateAnswer);


