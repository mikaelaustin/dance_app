import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';

class Home extends Component {
    constructor(props) {
        super(props);
        this.state = {
            schedule: undefined,
            dancerFilter:undefined,
            studioFilter: undefined,
            studioChecked: false,
            dancerChecked: false,
            user: undefined,
            allDancers: [],
        };
    }
    filterUserStudio(studio){
    	if(!this.state.studioChecked){
	    	const filteredStudio = this.state.schedule.filter((s) => s.studio === this.state.user.studio);
	    	this.setState({
	    		schedule: filteredStudio,
	    		studioChecked: true
	    	})
	    } else {
	    	this.setState({
	    		schedule: this.state.allDancers,
	    		studioChecked:false
	    	})
	    }
    }
      logoutUser(){
        fetch('/api/logout', {
            method: 'DELETE',
            credentials: 'same-origin'
        }).then((response) => {
        	if(response.status == 204){
        		this.props.history.push('/');
        	}
        });
    }

   filterUserDancers(dancers){
   		if(!this.state.dancerChecked){
   			var matchDancers = []
	   		for(var j=0; j < this.state.user.dancers.length; j++){
	   			for (var i=0; i < this.state.schedule.length; i++){
		   			if(this.state.schedule[i].dancers.indexOf(this.state.user.dancers[j]) > -1){
		   				matchDancers.push(this.state.schedule[i])
		   				this.setState({
		   					dancerChecked: true
		   				})
		   			}
	   			}
	   		}
	   		console.log(matchDancers)
	   		this.setState({
	   			schedule: matchDancers
	   		})
   		} else {
   			this.setState({
   				dancerChecked: false,
   				schedule: this.state.allDancers
   			})
   		}

   	//for loop 
   	//if schedule.dancer[i]===user.dancer[j]
   } 
//use two for loops
//one loops through schedule.dancers, and one through user.dancers
// 

    componentWillMount(){
    	fetch('/api/schedule', {
    		headers: {
                'content-type': 'application/json',
                'accept': 'application/json'
            },
            credentials: 'same-origin'
    	}).then((response) => response.json()).then((results) => {
    		console.log(results)
    		this.setState({
    			schedule: results,
    			allDancers: results
    		});
    	});

    	fetch('/api/logged-in', {
    		headers: {
                'content-type': 'application/json',
                'accept': 'application/json'
            },
            credentials: 'same-origin' 
    	}).then((response) => response.json()).then((results) => {
    		console.log(results)
            if(results.message){
                if(results.message === "logged-in"){
                    this.setState({
                    	user: results.user
                    })
                }
            }
    	});

    }
    render(){
    	console.log(this.state)
    	const appendResults = () => {
    		if(this.state.schedule){
    			return this.state.schedule.map((r, index) => {
    				return (
    					<tr key={index}>
    						<td>{r.id}</td>
    						<td>{r.song}</td>
    						<td>{r.studio}</td>
    						<td>{r.dancers}</td>
    					</tr>	
    				)
    			})
    		}
    	}
    	//filter by dance studio when radio box is checked
    	//findall for all rows each time the string of the dancer's name is matched
    	//findall for all rows each time string of dance studio is called
    	return (
	    	<div id="schedule-page">
	    		<nav className="navbar">
					<h1 id="nycda"className="text-center">NYCDA</h1>
				</nav>
	    		<div id="studio-check">
		    		<input 
		    			id="check"
		    			type="checkbox"
		    			onChange={() => this.filterUserStudio(this.state.user.studio)}
		    		/>See only my studio   
		    	</div>	
		    	<div id="dancer-check">
		    		<input 
		    			id="check"
		    			type="checkbox"
		    			onChange={() => this.filterUserDancers(this.state.schedule)} 
		    		/>Filter by favorite dancers    
		    	</div>
	    		<table id="table-schedule"className = "table table-bordered">
	    			<thead id="table-head" className="thead">
		    			<tr>
		    				<th id="num">#</th>
		    				<th id="song">Song</th>
		    				<th id="stud">Studio</th>
		    				<th id="danc">Dancers</th>
		    			</tr>
		    		</thead>
		    		<tbody className=" table-striped table-hover">
		    		{appendResults()}
		    		</tbody>		
	    		</table>
	    		<button className="btn btn-default text-center" id="exit-button" onClick={this.logoutUser.bind(this)}>Sign Out</button>
	    	</div>
    	)
    }
}
export default withRouter(Home)