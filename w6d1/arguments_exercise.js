function sum(){
  var arr = [].slice.call(arguments);
  return sumWithArg(arr);
}

function sumWithArg(arr){
  let tmp =  arr.reduce(function(acc, x) {
    return acc+x;
  }, 0);
  return tmp;
}

console.log(sum(1, 2, 3, 4, 5));

function test(...args) {
  return args.reduce(function(acc, x) {
    return acc+x;
  }, 0);
}


console.log(test(12321,312321,312321));
