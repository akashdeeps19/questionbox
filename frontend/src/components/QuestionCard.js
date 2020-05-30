import React, { Component } from 'react';

const QuestionCard = ({ question }) => {
    // console.log(question.question+ "this is the question");
    return (
        <div>
          <h4>{question.question}</h4>
        </div>
        
    );
}

export default QuestionCard;
