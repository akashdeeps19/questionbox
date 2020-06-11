import React, { Component } from 'react';
import { connect } from 'react-redux';
import { createQuestion } from '../actions/questions';

class AskQuestion extends Component {

  constructor() {
      super();
      this.state = {
        title: "",
        details: ""
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
    const rdd = {question:this.state.title , topics:[1,2]}

    createQuestion(rdd, history)
    this.setState({ title: '', details: '' });
  }

  render() {
    return (
      <form onSubmit={this.handleOnSubmit}>
        <input
          style={{ border: '4px inset #99ccff'}}
          type="textarea"
          name="Title"
          value={this.state.title}
          onChange={this.handleOnChange}
          placeholder="Ask a Question"
        />

        <br/>
        <br/>

          <input
          style={{ border: '4px inset #99ccff'}}
          type="textarea"
          name="Topic"
          value={this.state.topic}
          placeholder="Topic goes here!"
        />
        {/* <input
          type="text"
          name="details"
          value={this.state.details}
          onChange={this.handleOnChange}
          placeholder="Add Topic"
        /> */}
        <br/>
        <br/>
        <button>Ask Question</button>
      </form>
    );
  }
}

export default connect(null, {createQuestion})(AskQuestion);