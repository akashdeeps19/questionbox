import React from 'react'
import {  Link } from 'react-router-dom'
import axios from 'axios'
import {  Col, FormControl, FormGroup, Button, Checkbox, Modal } from 'react-bootstrap'
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
      evt.preventDefault();
    	let self = this;
		axios.post(`http://192.168.1.7:3000/auth/signup`, this.state.form)
		  .then(function (response) {
		    console.log(response);
		   if(response.data.status === 200)
		   		self.setState({ show: true });
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
			<Col sm={4} smOffset={4} style={{marginTop:'140px'}}>
				<Col>
				<form className="well" onSubmit={this.onSubmit}>
					<h1 style={{textAlign:'center', marginBottom:'20px'}}>Signup</h1>
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
				      <FormControl type="text" placeholder="bio" onChange={this.onChange.bind(this,'bio')} style={{height:'40px'}}/>
				    </FormGroup>
				    <FormGroup>
				      <FormControl type="email" placeholder="Email" onChange={this.onChange.bind(this,'email')} style={{height:'40px'}}/>
				    </FormGroup>
				    <FormGroup>
				      <FormControl type="password" placeholder="Password" onChange={this.onChange.bind(this,'password')} style={{height:'40px'}}/>
				    </FormGroup>
				    
				    <FormGroup>
				    <Col>
				      <Checkbox style={{float:'left',marginTop:'0px'}}>Check me out</Checkbox>
				      <Link className="pull-right" to="/login">login ?</Link>
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
				      <Button bsStyle="primary" style={{width:'100%', height:'40px',marginBottom:'10px'}}type="submit">submit</Button>
				    </FormGroup>
				    
				    	
				   	
				 </form>
				 </Col>
			</Col>
		)
	}
}