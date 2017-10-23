import React from 'react';

class Clock extends React.Component{
  constructor(props){
    super(props);
    this.state = { time: new Date()};
    this.tick = this.tick.bind(this);
  }

  componentDidMount(){
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    this.intervalId.clearInterval();
  }

  tick(){
    let time = new Date();
    this.setState({ time });
  }

  render(){
    let hours = this.state.time.getHours();
    let minutes  = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();
    let date = this.state.time.toDateString();
    hours = (hours < 10) ? `0${hours}` : hours;
    minutes = (minutes < 10) ? `0${minutes}` : minutes;
    seconds = (seconds < 10) ? `0${seconds}` : seconds;

    return (
      <div>
        <h1>Clock</h1>
        <div className="mainClock">
          <div className="clock">
          <div>Time:</div>
          <div>{hours}:{minutes}:{seconds}</div>
          </div>
          <div className="clock">
          <div>Date:</div>
          <div>{date}</div>
          </div>
        </div>
        </div>
    );
  }
}


export default Clock;
