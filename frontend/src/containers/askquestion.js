import React, { Component } from 'react';
import { connect } from 'react-redux';
import { createQuestion } from '../actions/questions';

class AskQuestion extends Component {

  constructor() {
      super();
      this.state = {
        question: "",
        topic: ""
      }
    }

  handleOnChange = event => {
    const { name, value } = event.target;
    this.setState({
      [name]: value
    });
  }

  handleOnSubmit = event => {
    event.preventDefault()
    const { history, createQuestion } = this.props
    createQuestion(this.state, history)
    this.setState({ question: '', topic: '' });
  }

  render() {
    return (
      <form onSubmit={this.handleOnSubmit}>
        <input
          type="text"
          name="title"
          value={this.state.question}
          onChange={this.handleOnChange}
          placeholder="Ask a Question"
        />
        <input
          type="text"
          name="details"
          value={this.state.topic}
          onChange={this.handleOnChange}
          placeholder="Add Details"
        />

        <button>Ask Question</button>
      </form>
    );
  }
}

export default connect(null, {createQuestion})(AskQuestion);
