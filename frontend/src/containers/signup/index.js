import React from 'react'
import {  Link } from 'react-router-dom'
import axios from 'axios'
import {  Col, FormControl, FormGroup, Button, Checkbox, Modal, Image, Grid, Thumbnail } from 'react-bootstrap'

export default class Signup extends React.Component{
	constructor(props){
		super(props);

		this.state={
			form: {
		        
		        user_name: '',
		        first_name:'',
		        last_name:'',
		        email: '',
		        password:'',
		        bio:''
		    },
		    show: false
		}

	}
	onChange = (key,e) => {
		let {form} = this.state;
		form[key] = e.target.value
		
	}
                
	onSubmit = (evt) => {
		console.log(this.state.form)
		sessionStorage.setItem('name',this.state.form.user_name);
      evt.preventDefault();
    	let self = this;
		axios.post(`http://localhost:3000/auth/signup`, this.state.form)
		  .then(res => {
  			sessionStorage.setItem('token',res.data.token);
				this.props.history.push('/');
			})
		  .catch(function (error) {
		    console.log(error);
		  });
    }
    login = () => {
    	this.props.history.push('/login')
    }


	render(){
		let close = () => this.setState({ show: false });
		return(
			<Col sm={4} smOffset={4} style={{marginTop:'40px'}}>
			
				<Col>
				<form className="well" onSubmit={this.onSubmit}>
					<h1 style={{textAlign:'center', marginBottom:'20px'}}>Register to get started!</h1>
				    <FormGroup>
				      <FormControl type="text" placeholder="User Name" onChange={this.onChange.bind(this,'user_name')} style={{height:'40px'}}/>
				    </FormGroup>
				    <FormGroup>
				      <FormControl type="text" placeholder="First Name" onChange={this.onChange.bind(this,'first_name')} style={{height:'40px'}}/>
				    </FormGroup>
				    <FormGroup>
				      <FormControl type="text" placeholder="Last Name" onChange={this.onChange.bind(this,'last_name')} style={{height:'40px'}}/>
				    </FormGroup>
				    <FormGroup>
				      <FormControl type="text" placeholder="Bio - Describe yourself in a line" onChange={this.onChange.bind(this,'bio')} style={{height:'40px'}}/>
				    </FormGroup>
				    <FormGroup>
				      <FormControl type="email" placeholder="Email" onChange={this.onChange.bind(this,'email')} style={{height:'40px'}}/>
				    </FormGroup>
				    <FormGroup>
				      <FormControl type="password" placeholder="Password" onChange={this.onChange.bind(this,'password')} style={{height:'40px'}}/>
				    </FormGroup>
				    
				    <FormGroup>
				    <Col>
				      <Checkbox style={{float:'left',marginTop:'0px'}}>       I would like to receive promotional mail and notifications regarding my questions, and interested topics.</Checkbox>
				      <Link className="pull-right" to="/login">Already have an account ?</Link>
				      <div style={{ backgroundImage: `url(require("./login.jpeg"))`, backgroundPosition: 'center',backgroundSize: 'cover',backgroundRepeat: 'no-repeat'}}/>
				      </Col>
				    </FormGroup>
				    <Modal
				      bsSize="small"
			          show={this.state.show}
			          onHide={close}
			          container={this}
			          aria-labelledby="contained-modal-title"
			        >
			          <Modal.Header closeButton>
			          </Modal.Header>
			          <Modal.Body >
			          		<p style={{textAlign:'center'}}><b>Register Successfully !</b></p>
			          </Modal.Body>
			          <Modal.Footer>
			            <Button block bsStyle="primary" onClick={this.login}>Login</Button>
			          </Modal.Footer>
			        </Modal>

				    <FormGroup>
				      <Button bsStyle="primary" style={{width:'100%', height:'40px',marginBottom:'10px'}}type="submit">Register</Button>
				    </FormGroup>


				    	
				   	
				 </form>
				 </Col>
					<div style={{backgroundImage: `url(https://source.unsplash.com/random)`, backgroundPosition: 'center',backgroundSize: 'cover',backgroundRepeat: 'no-repeat'}}/>

			</Col>



		)
	}
}
