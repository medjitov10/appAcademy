Array.prototype.uniq = function(){
  result = [];

  for (var i = 0; i < this.length; i++) {
    if(!result.includes(this[i])){
      result.push(this[i])
    }
  }
  return result;
};

// console.log([1,2,3,4,2,3,3].uniq());


Array.prototype.toSum = function(){
  result = [];

  for (var i = 0; i < this.length-1; i++) {
    for (var j = i+1; j < this.length; j++) {
      if( this[i]+this[j] == 0 ){
        result.push([i,j]);
      }
    }
  }

  return result;
}


// console.log([1,-1,2,-2,3,4,3,41,-3].toSum());






Array.prototype.transpose = function(){
  result = new Array(this[0].length)
  console.log(result)
  for (var i = 0; i < this.length; i++) {
    result[i] = new Array(this.length)
  }

  for (var i = 0; i < this.length; i++) {
    for (var j = 0; j < this[i].length; j++) {
      result[j][i] = this[i][j]
    }
  }
  return result;
}

console.log([[1,2],[4,5],[7,9]].transpose());
