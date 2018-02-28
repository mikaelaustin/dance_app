import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';

class Login extends Component {
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
            }, 
         credentials: 'same-origin'   
   		}).then((response) => response.json()).then((results) => {
   			console.log(results)
        console.log("hello")
        if(results.status==401){
          alert("Incorrect username or password")
        } else {
          this.props.history.push("/schedule")
          console.log(results)
        }
   		})
   }
componentWillMount(){
    fetch('/api/logged-in', {
        headers: {
            'content-type': 'application/json',
            'accept': 'application/json'
        },
        credentials: 'same-origin'
    }).then((response) => response.json())
    .then((results) => {
        if(results.message === "logged-in"){
            this.props.history.push("/schedule")
        }
    });
  }

   render(){
      return (
        <div className="text-center">
          <div>
            <h2 id="login-header">Login</h2>
            <form onSubmit={this.loginForm.bind(this)}>
              <input className="offset-md-4 form-control" id="login-user" type="text" ref="username" placeholder= "Username"/><br></br>
              <input className="offset-md-4 form-control " id="login-pword" type="password" ref="password" placeholder= "Password"/><br></br>
              <button id="login-button" className="btn btn-default" type="submit" >Submit</button>
            </form>
            <p id="account">Don't have an account? <a id="register"href="/register">Register</a></p>
          </div>
          {this.state.login}  
        </div>
        )
    }
 }  

export default withRouter(Login)
