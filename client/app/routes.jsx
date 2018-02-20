import React from "react";
import { Route, Switch } from "react-router-dom";

import Schedule from "./components/Home";
import Register from "./components/Signup"
import Login from "./components/Login"



export default (
	<Switch>
    	<Route>
    		<Route exact path="/" component={Login} />
    		<Route path="/api/register" component={Register} />
    		<Route path="/api/schedule" component={Schedule}/>
    	</Route>
    </Switch>
);