import React, { Component } from 'react';
import Select from 'react-select';
import Autocomplete from 'react-autocomplete';

export default class Signup extends Component {
    constructor(props) {
        super(props);
        this.state = {
            signedUp: undefined,
            dancer:undefined,
            studio:undefined,
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
   			location: this.refs.locationDropdownValue.value,
   			studio: this.refs.studioDropdownValue.value,
   			dancers: this.refs.dancerDropdownValue.value
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
    	console.log(this.state)
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
    	<div className = "text-center">
    		<div>
    			<h2>Register</h2>
	    		<form onSubmit={this.submitSignUpForm.bind(this)}>
	    			<input type="text" ref="name" placeholder= "Enter first & last name"/><br></br>
	    			<input type="text" ref="email" placeholder= "Email"/><br></br>
	    			<input type="text" ref="phone" placeholder= "Phone #"/><br></br>
	    			<input type="text" ref="username" placeholder= "Create Username"/><br></br>
	    			<input type="password" ref="password" placeholder= "Create Password"/><br></br>
	    			<select value={this.state.locationDropdownValue} onChange={this.handleLocationDropdownChange.bind(this)}>
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
	    			
	    			<p>What studio are you with?</p>
	    			<br></br>
	    			<select value={this.state.studioDropdownValue} onChange={this.handleStudioDropdownChange.bind(this)}>
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
	    		<p>Select dancers to add to your favorites (optional)</p>
	    		<br></br>	
	    		<Autocomplete
	    			getItemValue={(item) => item.dancer}
                    items={dancerArray}
                    renderItem={(item, isHighlighted) => 
                        this.state.value ? 
                            <div>
                               <input 
                               		placeholder="Begin typing name(s)"
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
                <div>
                    {
                        filteredArr && filteredArr.length > 0 ?
                            filteredArr.map((arr, index) => {
                                return (
                                    <div>
                                        <p key={index}>{arr.dancer}</p>
                                    </div>
                                )
                            }) : <p></p> 
                    }
                </div> 
	    			<input className="btn btn-default" type="submit" value="Register" href="/login"/>
	    		</form>
	    	</div>
	    	{this.state.signedUp}	
    	</div>	
    	);		
    }
}

