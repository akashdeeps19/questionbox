import React, { Component } from 'react';


const AnswerCard = ({content,upvotes, downvotes, rating, upvoter, downvoter ,comment }) => { 
    return (
        <div>
          <p>{content}</p>
          <p className="rating">HELPFULNESS RATING: {rating}</p>
           <p > Upvotes :{upvotes}</p>
	 <p > Downvotes :{downvotes}</p>

          <button onClick={upvoter}>Upvote</button>

          <button onClick={downvoter}>Downvote</button>
          <p> Comments </p>
          <p> {comment} </p>
        </div>
    );
}

export default AnswerCard;

