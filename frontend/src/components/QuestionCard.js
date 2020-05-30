import React, { Component } from 'react';

const QuestionCard = ({ question }) => {

    return (
        <div>
          <h4>{question.question}</h4>
        </div>
    );
}

export default QuestionCard;
