import React, { Component } from 'react';

export default class Signup extends Component {
    constructor(props) {
        super(props);
        this.state = {
            login: undefined
        };
    }
   
   loginForm(e){
   		e.preventDefault();

   		var loginData = {
   			username: this.refs.username.value,
   			password: this.refs.password.value
   		}

   		fetch('/api/login', {
   			method: 'post',
   			body: JSON.stringify(loginData),
   			 headers: {
                'content-type': 'application/json',
                'accept': 'application/json'
            } 
   		}).then((response) => response.json()).then((results) => {
   			console.log(results)
   			let loggedIn = results ? "Yes" : "No"
   			this.setState({
   				login: loggedIn
   			})
   		})
   }

   render(){
      return (
        <div className="text-center">
          <div>
            <h2>Login</h2>
            <form onSubmit={this.loginForm.bind(this)}>
              <input type="text" ref="username" placeholder= "Username"/><br></br>
              <input type="password" ref="password" placeholder= "Password"/><br></br>
              <button className="btn btn-default" type="submit">Submit</button>
            </form>
            <p>Don't have an account? <span href="/register">Register</span></p>
          </div>
          {this.state.login}  
        </div>
        )
    }
 }  
