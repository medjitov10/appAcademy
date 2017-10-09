Array.prototype.bubbleSort = function() {
  flag = true
  while(flag){
    flag=false;

    for (var i = 0; i < this.length-1; i++) {

      if( this[i] > this[i+1] ){
        let tmp = this[i]
        this[i] = this[i+1]
        this[i+1] = tmp;
        flag = true;
      }
    }
  }

  return this
}

console.log([4,3,2,1,3123,1,321321,-323].bubbleSort());


String.prototype.substring = function(){
  result = ""

  for (var i = 0; i < this.length; i++) {
    tmp = ""
    for (var j = i; j < this.length; j++) {
      tmp += (this.slice(i,j+1))
      tmp += this.length - i == 1 ? "" : ", "
    }
    result += tmp
  }
  return result;
}



console.log("abc".substring());
