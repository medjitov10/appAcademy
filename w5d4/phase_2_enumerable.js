Array.prototype.myEach = function (callback) {

  for (var i = 0; i < this.length; i++) {
    callback(this[i])
  }
};



[1, 2, 3].myEach((num) => {
  console.log(num);
})


Array.prototype.myMap = function (callback) {
  result = []
  for (var i = 0; i < this.length; i++) {
    result.push(callback(this[i]))
  }
  console.log(result);
  return result
};


[1,2,3].myMap((el) => {
  return `${el} is map`
})

Array.prototype.myReduce = function(callback,acc){
  if ( acc ){
    result = acc
  }
  else{
    result = this[0]
  }
  for (var i = 0; i < this.length; i++) {
    result = callback(result, this[i])
  }
  console.log(result);
  return result;
};

[1,2,3].myReduce((acc, el) => {
  return acc + el;
},25)
