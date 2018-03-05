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
        if(!results.success){
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
        <div >
          <div>
            <nav className="navbar">
              <img id="nycda"src={'./images/nycda_logo.png'}className="img-responsive"/>
            </nav>
              <h2 id="login-header">Login</h2>
              <form onSubmit={this.loginForm.bind(this)}>
                <input className="offset-md-4 form-control" id="login-user" type="text" ref="username" placeholder= "Username"/><br></br>
                <input className="offset-md-4 form-control " id="login-pword" type="password" ref="password" placeholder= "Password"/><br></br>
                <button id="login-button" className="btn btn-default" type="submit" >Submit</button>
              </form>
              <p id="account">Don't have an account? <a id="register"href="/register">Register</a></p>
            
            <div className="crossfade">
                <figure></figure>
                <figure></figure>
                <figure></figure>
                <figure></figure>
                <figure></figure>
                <figure></figure>
                <figure></figure>
                <figure></figure>
                <figure></figure>
                <figure></figure>
             </div> 
             {/*
                <div className="fadein">
                <img id="pic1" src={'./images/group5.jpg'}/>
                <img id="pic2" src={'./images/dancer7.jpg'}/>
                <img id="pic3" src={'./images/group1.jpg'}/>
                <img id="pic4" src={'./images/dancer6.jpg'}/>
                <img id="pic5" src={'./images/dancer2.jpg'}/>
                <img id="pic6" src={'./images/group2.jpg'}/>
                <img id="pic7" src={'./images/dancer4.jpg'}/>
                <img id="pic8" src={'./images/group3.jpg'}/>
                <img id="pic9" src={'./images/dancer5.jpg'}/>
                <img id="pic10" src={'./images/group4.jpg'}/>
             
             </div>
               */}

             
          </div>
          {this.state.login}  
        </div>
        )
    }
 }  

export default withRouter(Login)
