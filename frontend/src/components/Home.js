import React, { Component } from 'react';
import { Link } from 'react-router-dom'
import { Button } from 'react-bootstrap';

const Home = () => {
    return (
        <div>
          <h4>Welcome to QuestionBox!</h4> 
          <p>Go ahead and venture into the Box of Questions!</p>
          <br/>
                    <Link style={{ color: 'white' }} to={`/questions/new`}><Button style={{ backgroundColor: '#b92b27', borderColor: '#b92b27' }}>Ask a Question</Button></Link>

          <img src={require("./q.png")} />
                    <Link style={{ marginRight: '5px', color: 'white' }} to={`/questions`}><Button style={{ backgroundColor: '#009933', borderColor: '#009933' }}>Answer Questions</Button></Link>

          <img src={require("./a.png")} />
        </div>
    );
}

export default Home;
