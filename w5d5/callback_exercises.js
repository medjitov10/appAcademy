class Clock{
  constructor(){
    this.date = new Date();
    this.h = this.date.getHours();
    this.m = this.date.getMinutes();
    this.s = this.date.getSeconds();
    this.printTime();
    this._tick();
    setInterval(this._tick.bind(this), 1000);
  }


  printTime(){
    let current_time = `${this.h} : ${this.m} : ${this.s}`;
    console.log(current_time);
  }

  _tick(){
    this.s++
    if(this.s == 60 ){
      this.s = 0;
      this.m++;
    }

    if(this.m == 60 ){
      this.m = 0;
      this.h++;
    }

    if(this.h == 24){
      this.h = 0;
    }
    this.printTime();
  }




}

const time = new Clock;
