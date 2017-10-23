import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Weather from './weather';
document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("main");
	ReactDOM.render(
		<Root />, root);
});

class Root extends React.Component {
	render(){
		return(
			<div className="mainDiv">
				<Clock />
				<Weather />
			</div>
		);
	}
}
