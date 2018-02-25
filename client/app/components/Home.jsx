import React, { Component } from 'react';

export default class Home extends Component {
    constructor(props) {
        super(props);
        this.state = {
            schedule: undefined,
            dancerFilter:undefined,
            studioFilter: undefined
        };
    }
    componentWillMount(){
    	fetch('/api/schedule', {
    		headers: {
                'content-type': 'application/json',
                'accept': 'application/json'
            },
    	}).then((response) => response.json()).then((results) => {
    		console.log(results)
    		this.setState({
    			schedule: results
    		});
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
	    	<div>
	    		<input type="checkbox"/>See only my studio
	    		<input type="radio"/>Filter by favorite dancers
	    		<table>
	    			<thead>
		    			<tr>
		    				<th>#</th>
		    				<th>Song</th>
		    				<th>Studio</th>
		    				<th>Dancers</th>
		    			</tr>
		    		</thead>
		    		<tbody>
		    		{appendResults()}
		    		</tbody>		
	    		</table>
	    	</div>
    	)
    }
}