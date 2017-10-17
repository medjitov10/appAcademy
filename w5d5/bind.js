class Lamp{
  constructor(){
    this.name = 'a lamp';
  }
}

const turnOn = function(){
  console.log("Turning on "+ this.name);
}

Function.prototype.myBind = function (context){
  return () =>{
    this.apply(context)
  }
}

const lamp = new Lamp();


const boundTurnon = turnOn.bind(lamp);
const myboundTurnon = turnOn.myBind(lamp);

boundTurnon();
myboundTurnon();
