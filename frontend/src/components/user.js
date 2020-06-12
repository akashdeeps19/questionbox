import React, { Component } from 'react';

// get posts from online api
// it's return a json file
class User extends Component {
    constructor(props){
        super(props);
        this.state = {
            error : null,
            isLoaded : false,
            posts : []          
        };
    }

    componentDidMount(){
        var nam = sessionStorage.getItem('name')
	console.log("name is" + nam);
        fetch(`http://localhost:3000/users/${nam}/`)
        .then( response => response.json())
        .then(
            // handle the result
            (result) => {
                this.setState({
                    isLoaded : true,
                    posts : result
                });
            },

            // Handle error 
            (error) => {
                this.setState({
                    isLoaded: true,
                    error
                })
            },
        )
    }

    render() {
        const {error, isLoaded, posts} = this.state;

        if(error){
            return <div>Error in loading</div>
        }else if (!isLoaded) {
            return <div>Loading ...</div>
        }else{
            return(
                <div>
		    <p>UserName : {posts.user_name}</p>
			<p>First Name : {posts.first_name}</p>
			<p>LastName : {posts.last_name}</p>
			<p>Email : {posts.email}</p>
			<p> Bio : {posts.bio} </p>
                    
                    
                </div>
            );
        }
      
    }
  }
  
  export default User;
