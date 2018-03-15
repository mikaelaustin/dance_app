import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import Autocomplete from 'react-autocomplete';

class Signup extends Component {
    constructor(props) {
        super(props);
        this.state = {
            locationDropdownValue: 'Choose Location',
            dancerDropdownValue: 'Choose Dancer',
            dancers: [],
            allSelected: [],
            value:'',
            selectDancer: undefined,
            studioDropdownValue: 'Select Studio'
        };
    }
   
   submitSignUpForm(e){
   		e.preventDefault();
   		const { locationDropdownValue } = this.state; 
   		const { studioDropdownValue } = this.state; 
   		const { dancerDropdownValue } = this.state; 
   		var inputData = {
   			name: this.refs.name.value,
   			email: this.refs.email.value,
   			phone: this.refs.phone.value,
   			username: this.refs.username.value,
   			password: this.refs.password.value,
   			location: this.state.locationDropdownValue,
   			studio: this.state.studioDropdownValue,
   			dancers: this.state.allSelected
   		}
   		fetch('/api/register', {
   			method: 'post',
   			body: JSON.stringify(inputData),
   			 headers: {
                'content-type': 'application/json',
                'accept': 'application/json'
            } 
   		}).then((response) => response.json()).then((results) => {
   			// console.log(results)
   			// let signUpSuccess = results ? "Yes" : "No"
   			// this.setState({
   			// 	signedUp: signUpSuccess
   			// })
   			if(results){
   				this.props.history.push('/');
   			}
   		})
   }
   handleLocationDropdownChange(e){
   		this.setState({
   			locationDropdownValue: e.target.value
   		})
   }
   handleDancerDropdownChange(e){
   		this.setState({
   			dancerDropdownValue: e.target.value
   		})
   }
   handleStudioDropdownChange(e){
   	this.setState({
   		studioDropdownValue: e.target.value
   		})
   }
   allSelectedChange(e){
   		console.log(e)
        this.setState({
            allSelected: this.state.allSelected.concat(e)
        })
    }
    selectDancerChange(e){
        this.setState({
            selectDancer: e,
            value: e
        })
    }
    componentDidMount(){
    	//document.getElementsByClassName('my_ra')[0].setAttribute('id', 'signup_ra')
    	$('input[role="combobox"]').attr('id', 'signup_ra');
    }
   componentWillMount(){
   	fetch('/api/dancers', {
			headers: {
                'content-type': 'application/json',
                'accept': 'application/json'
            }
		}).then((response) => response.json())
        .then((results) => {
            this.setState({
            	dancers: results
            })
        });
   }
//Get Route for dancers using dancers model so that drop down appears and gets filtered on change


    render(){
    	// console.log(this.state)
    	const {dancers, selectDancer, value} = this.state;
    	console.log(this.props.menuStyle)
        let dancerArray = [];
        let filteredArr;

         if(dancers.length > 0){
            if(selectDancer){
                filteredArr = dancers.filter((dancer) => selectDancer === dancer.dancer);
            }

            let mapDancers = [...new Set(dancers.map((dancer) => dancer.dancer))];
            mapDancers.forEach((dancer) => {
                dancerArray.push({dancer: dancer})
            })
        }
    	// const appendDancers = () => {
    	// 	return this.state.dancers.map((dancer, index) => {
    	// 		return (
    	// 			<option key={index} value={dancer.dancer}>{dancer.dancer}</option>
    	// 		)
    	// 	})
    	// }
    	return (
    	<div className = "text-center center-block">
    		<nav className="navbar">
				<img id="nycda"src={'./images/nycda_logo.png'}className="img-responsive"/>
			</nav>
    		<div id="form-div" >
    			<h2 id="register-head" className="text-center">Register</h2>
	    		<form id="register-form" onSubmit={this.submitSignUpForm.bind(this)}>
		    			<input id="reg-name"className="form-control" type="name" ref="name" placeholder= "Enter first & last name"/><br></br>
		    			<input id="reg-email"className="form-control" type="email" ref="email" placeholder= "Email"/><br></br>
		    			<input id="reg-phone"className="form-control bfh-phone" type="phone" ref="phone" data-validation="number"data-format="(ddd)ddd-dddd"placeholder= "Phone # (only #s)"/><br></br>
		    			<input id="reg-un"className="form-control" type="text" ref="username" placeholder= "Create Username"/><br></br>
		    			<input id="reg-pword"className="form-control" type="password" ref="password" placeholder= "Create Password"/><br></br>
		    			<p id="select-font">Location of competition</p>
		    			<br></br>
		    			<select id="location-dropdown" value={this.state.locationDropdownValue} onChange={this.handleLocationDropdownChange.bind(this)}>
		    				<option value="Choose Location" disabled>Choose Location</option>
		    				<option value="Denver CO">Denver CO</option>
		    				<option value="Las Vegas NV">Las Vegas NV</option>
		    				<option value="Santa Clara CA">Santa Clara CA</option>
		    				<option value="Meadowlands NJ">Meadowlands NJ</option>
		    				<option value="Philadelphia PA">Philadelphia PA</option>
		    				<option value="Buffalo NY">Buffalo NY</option>
		    				<option value="Greenville NC">Greenville NC</option>
		    				<option value="Dallas TX">Dallas TX</option>
		    				<option value="Salt Lake City UT">Salt Lake City UT</option>
		    				<option value="Phoenix AZ">Phoenix AZ</option>
		    			</select>
		    			<br></br>
		    			
		    			<p id="select-font">What studio are you with?</p>
		    			<br></br>
		    			<select id="studio-dropdown" value={this.state.studioDropdownValue} onChange={this.handleStudioDropdownChange.bind(this)}>
		    				<option value="Select Studio" disabled>Choose your studio</option>
		    				<option value="Art In Motion">Art In Motion</option>
		    				<option value="Broadway Dancers">Broadway Dancers</option>
		    				<option value="Center Stage">Center Stage</option>
		    				<option value="DanceTown">DanceTown</option>
		    				<option value="Dancers Edge">Dancers Edge</option>
		    				<option value="Dance Dimensions">Dance Dimensions</option>
		    				<option value="Dance Perceptions">Dance Perceptions</option>
		    				<option value="Innovation Dance">Innovation Dance</option>
		    				<option value="On Pointe<">On Pointe</option>
		    				<option value="Premiere Dance Academy">Premiere Dance Academy</option>
		    				<option value="Prestige Arts Company">Prestige Arts Company</option>
		    				<option value="Shining Stars">Shining Stars</option>
		    				<option value="Starz Dance Company">Starz Dance Company</option>
		    				<option value="Studio L">Studio L</option>
		    				<option value="The Dance Zone">The Dance Zone</option>
		    				<option value="Xtreme Dance Force">Xtreme Dance Force</option>
		    			</select>
		    			<br></br>
		    			{/*
		    			<select value={this.state.dancerDropdownValue} onChange={this.handleDancerDropdownChange.bind(this)}>
		    				<option value="Choose Dancer" disabled>Add dancer(s) to favorites (optional)</option>
		    				{appendDancers()}
		    			</select>
		    			*/}
		    		<p id="select-font">Select dancers to add to your favorites (optional)</p>
		    		<br></br>	
		    		<Autocomplete
		    			getItemValue={(item) => item.dancer}
	                    items={dancerArray} 
	                    menuStyle={
	                    	{
	                    		width: '275px',
	                    		left:'192px',
	                    		top:'390px',
	                    		position:'absolute'
	                    		
	                    	}
	                    }
	                    renderItem={(item, isHighlighted) => 
	                        this.state.value ? 
	                            <div className="form-control" >
	                               <input 
	                                	type="checkbox" 
	                                	onChange={() => this.allSelectedChange(item.dancer)}
	                                	checked={this.state.allSelected.indexOf(item.dancer) > -1}
	                                />
	                             {item.dancer}
	                            </div> : <div></div>
	                    }
	                    shouldItemRender={(item, value) => item.dancer.toLowerCase().indexOf(value) > -1}
	                    value={this.state.value}
	                    onChange={
	                        (e) => {
	                            this.setState({ value: e.target.value })
	                        }
	                    }
	                    onSelect={this.selectDancerChange.bind(this)}
	                />
	                <br></br>
		    		<input id="reg-button" className="btn btn-default btn-glow" type="submit" value="Register"/>
	    		</form>
	    	</div>
	    	{this.state.signedUp}	
    	</div>	
    	);		
    }
}

export default withRouter(Signup)