import React, { Component } from 'react';

export default class Home extends Component {
    constructor(props) {
        super(props);
        this.state = {
            schedule: undefined
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
    	return (
	    	<div>
	    		<h1>WHY</h1>
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