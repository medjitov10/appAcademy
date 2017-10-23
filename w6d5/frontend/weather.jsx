import React from 'react';

class Weather extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      weather: null
    };
    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount(){
    navigator.geolocation.getCurrentPosition(this.getWeather);
  }

  getWeather(pos){
    const crd = pos.coords;
    var Url = 'http://api.openweathermap.org/data/2.5/weather?';
    var key = 'eaae38ce2362868257695336e44c2ef9';
    let responseUrl = `${Url}lat=${crd.latitude}&lon=${crd.longitude}&appid=${key}`;
    var request = new XMLHttpRequest();

    request.onreadystatechange = () => {
      if (request.status === 200 && request.readyState === XMLHttpRequest.DONE) {
        const data = JSON.parse(request.responseText);
        console.log(data);
        this.setState({
          weather: data
        });
      } else {
        console.log('error');
      }
    };

    request.open(
      'GET',
      responseUrl,
      true
    );
    request.send();
  }

  render(){
    let content = <div></div>;
    if (this.state.weather){
      let name = this.state.weather.name;
      let weather = ((this.state.weather.main.temp - 273.15) * 9/5) + 32;
      content = <div className="subWeather">
                  <p className="weather">{name}</p>
                  <p className="weather">{weather.toFixed(1)}</p>
                </div>;
    } else {
      let name = "";
      let weather = "Loading...";
      content = <div className="subWeather">
                  <p className="weather">{name}</p>
                  <p className="weather">{weather}</p>
                </div>;
    }
    return(
      <div class="mainWeather">
        <h1>Weather</h1>
        {content}
      </div>
    );
  }
}

export default Weather;
