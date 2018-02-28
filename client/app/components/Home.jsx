import React, { Component } from 'react';

export default class Home extends Component {
    constructor(props) {
        super(props);
        this.state = {
            schedule: undefined,
            dancerFilter:undefined,
            studioFilter: undefined,
            studioChecked: false,
            user: undefined
        };
    }
    filterUserStudio(studio){
    	const filteredStudio = this.state.schedule.filter((s) => s.studio === this.state.user.studio);
    	this.setState({
    		schedule: filteredStudio,
    		studioChecked: true
    	})
    }

    //  filterUserStudio(studio){
    //  	if(this.state.studioChecked)
    // 	const filteredStudio = this.state.schedule.filter((s) => s.studio === this.state.user.studio);
    // 	this.setState({
    // 		schedule: filteredStudio,
    // 		studioChecked: true
    // 	})
    // }

    // filterUserDancers(dancers){
    // 	const filteredDancers = this.state.schedule.filter((d) => d.dancers === this.state.user.dancers);
    // 	this.setState({
    // 		schedule:filteredDancers
    // 	})
    // }

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
    			schedule: results
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
		    			onChange={() => this.filterUserDancers(this.state.user.dancers)} 
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
	    	</div>
    	)
    }
}