import React from 'react'
import { Link } from 'react-router-dom'
import axios from 'axios';
import {withRouter} from 'react-router'

import {  Col, FormControl, FormGroup, Button, Checkbox } from 'react-bootstrap'
 class Login extends React.Component{
	constructor(props){
		super(props);

		this.state={
			form: {
		        user_name: '',
		        password: '',
		    },
		}
	}


	onChange = (key,e) => {
		let {form} = this.state;
		form[key] = e.target.value
		this.setState({ form });
	}

	onSubmit = (evt) => {
	  evt.preventDefault();
	  axios.post(`http://localhost:3000/auth/login`, this.state.form)
  		.then(res => {
  			sessionStorage.setItem('token',res.data.token);
				this.props.history.push('/');
			})

	  .catch(function (error) {
	    console.log(error);
	  });
	  console.log(sessionStorage.getItem('token')+" this is the token");
    }

	render(){
		return(
			<Col sm={5} smOffset={4} style={{marginTop:'140px'}}>
				<Col>
				<form className="well" onSubmit={this.onSubmit}>
					<h1 style={{textAlign:'center', marginBottom:'20px'}}>Login</h1>
				    <FormGroup>
				      <FormControl type="text" placeholder="Username" onChange={this.onChange.bind(this,'user_name')} style={{height:'40px'}}/>
				    </FormGroup>
				    <FormGroup>
				      <FormControl type="password" placeholder="Password" onChange={this.onChange.bind(this,'password')} style={{height:'40px'}}/>
				    </FormGroup>
				    <FormGroup>
				    <Col>
				      <Checkbox style={{float:'left',marginTop:'0px'}}> Remember me</Checkbox>
				      <br/>
				      <Link style={{textAlign:'center'}} className="pull-right" to="/Signup">Hurry up and register if you haven't!</Link>
				      </Col>
				    </FormGroup>
				    <FormGroup>
				      <Button bsStyle="primary" style={{width:'100%', height:'40px',marginBottom:'10px'}} onClick={this.onSubmit} type="submit">Login</Button>
				    </FormGroup>
				 </form>
				 </Col>
			</Col>
		)
	}
}
export default withRouter(Login)