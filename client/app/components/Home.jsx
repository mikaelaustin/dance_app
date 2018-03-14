import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import Autocomplete from 'react-autocomplete';

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
            dancers: [],
            allSelected: [],
            value:'',
            selectDancer: undefined,
        };
    }
    updateDancersForm(e){
   		e.preventDefault();

   		var dancers = this.state.user.dancers.concat(this.state.allSelected);

//the below should be updating dancer array in users
//put route
   		fetch('/api/update-dancer-favorites', {
   			method: 'put',
   			body: JSON.stringify({dancers: dancers}),
   			 headers: {
                'content-type': 'application/json',
                'accept': 'application/json'
            },
            credentials: 'same-origin'
   		}).then((response) => response.json()).then((results) => {
   			console.log(results)
   			// let signUpSuccess = results ? "Yes" : "No"
   			// this.setState({
   			// 	signedUp: signUpSuccess
   			// })
   			if(results){
   				console.log(results)
   			}
   		})
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
    	$('input[role="combobox"]').attr('id', 'home_ra');
    	//document.getElementsByClassName('my_ra')[0].setAttribute('id', 'home_ra')
    }
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
   	};

    render(){
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
					<img id="nycda"src={'./images/nycda_logo.png'}className="img-responsive"/>
				</nav>
				<div id="check-words">
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
			    </div>	
		    	<div id="more-dancers">
		    		<p id="add">Add more dancers to favorites</p>
		    		<form id="add-dancer-form" onSubmit={this.updateDancersForm.bind(this)}>
			    		<br></br>	
			    		<Autocomplete
			    			getItemValue={(item) => item.dancer}
		                    items={dancerArray} 
		                    id="dancerdrop"
		                   	menuStyle={
	                    		{
	                    			position: 'absolute',
	                    			top: '80px',
                            width: '275px'
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
		                
	                	<input id="more-dancer-button"className="btn btn-default" type="submit" value="Submit"/>
	                </form>		
		    	</div>
	    		<table id="table-schedule"className = "table table-bordered">
	    			<thead id="table-head" className="thead" >
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