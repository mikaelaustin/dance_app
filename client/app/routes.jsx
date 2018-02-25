import React from "react";
import { Route, Switch } from "react-router-dom";

import Schedule from "./components/Home";
import Register from "./components/Signup"
import Login from "./components/Login"



export default (
	<Switch>
    		<Route exact path="/" component={Login} />
    		<Route path="/register" component={Register} />
    		<Route path="/schedule" component={Schedule}/>
    </Switch>
);