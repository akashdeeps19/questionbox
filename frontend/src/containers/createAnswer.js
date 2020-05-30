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
      {/* <Answers question={this.props.question} /> */}
    </div>
    );
  }
}

export default connect(null, {createAnswer})(CreateAnswer);


