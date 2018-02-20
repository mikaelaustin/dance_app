import React, { Component } from 'react';

export default class Signup extends Component {
    constructor(props) {
        super(props);
        this.state = {
            signedUp: undefined
        };
    }
   
   submitSignUpForm(e){
   		e.preventDefault();

   		var inputData = {
   			name: this.refs.name.value,
   			email: this.refs.email.value,
   			phone: this.refs.phone.value,
   			username: this.refs.username.value,
   			password: this.refs.password.value,
   			location: this.refs.location.value,
   			studio: this.refs.studio.value,
   			dancers: this.refs.dancers.value

   		}

   		fetch('/api/signup', {
   			method: 'post',
   			body: JSON.stringify(inputData),
   			 headers: {
                'content-type': 'application/json',
                'accept': 'application/json'
            } 
   		}).then((response) => response.json()).then((results) => {
   			console.log(results)
   			let signUpSuccess = results ? "Yes" : "No"
   			this.setState({
   				signedUp: signUpSuccess
   			})
   		})
   }

    render(){
    	return (
    	<div className = "text-center">
    		<div>
    			<h2>Register</h2>
	    		<form onsSubmit={this.submitSignUpForm.bind(this)}>
	    			<input type="text" ref="name" placeholder= "Enter first & last name"/><br></br>
	    			<input type="text" ref="email" placeholder= "Email"/><br></br>
	    			<input type="text" ref="phone" placeholder= "Phone #"/><br></br>
	    			<input type="text" ref="username" placeholder= "Create Username"/><br></br>
	    			<input type="password" ref="password" placeholder= "Create Password"/><br></br>
	    			<select ref="location">
	    				<option selected value="choose location">Choose Location</option>
	    				<option value="denver-co">Denver CO</option>
	    				<option value="las-vegas-nv">Las Vegas NV</option>
	    				<option value="santa-clara-ca">Santa Clara CA</option>
	    				<option value="meadowlands-nj">Meadowlands NJ</option>
	    				<option value="philadelphia-pa">Philadelphia PA</option>
	    				<option value="buffalo-ny">Buffalo NY</option>
	    				<option value="greenville-nc">Greenville NC</option>
	    				<option value="dallas-tx">Dallas TX</option>
	    				<option value="salt-lake-city-ut">Salt Lake City UT</option>
	    				<option value="phoenix-az">Phoenix AZ</option>
	    			</select>
	    			<select ref="studio">
	    				<option selected value="choose studio">Choose your studio</option>
	    				<option value="art-in-motion">Art In Motion</option>
	    				<option value="broadway-dancers">Broadway Dancers</option>
	    				<option value="center-stage">Center Stage</option>
	    				<option value="dancetown">DanceTown</option>
	    				<option value="dancers-edge">Dancers Edge</option>
	    				<option value="dance-dimensions">Dance Dimensions</option>
	    				<option value="dance-perceptions">Dance Perceptions</option>
	    				<option value="innovation-dance">Innovation Dance</option>
	    				<option value="on-pointe">On Pointe</option>
	    				<option value="premiere-dance-academy">Premiere Dance Academy</option>
	    				<option value="prestige-arts-company">Prestige Arts Company</option>
	    				<option value="shining-stars">Shining Stars</option>
	    				<option value="starz-dance-company">Starz Dance Company</option>
	    				<option value="studio-l">Studio L</option>
	    				<option value="the-dance-zone">The Dance Zone</option>
	    				<option value="xtreme-dance-force">Xtreme Dance Force</option>
	    			</select>
	    			<select ref="dancers">
	    				<option selected value="select dancers">Add dancer(s) to favorites (optional)</option>
	    				<option></option>
	    				<option></option>

	    			</select>	
	    			<button className="btn btn-default" type="submit">Submit</button>
	    		</form>
	    	</div>
	    	{this.state.signedUp}	
    	</div>	
    	);		
    }
}

