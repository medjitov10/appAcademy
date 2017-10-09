function range(start, end) {
  if (start === end) {
    return [];
  }

  arr = range(start, end-1);
  arr.push(end-1)
  return arr;
};


console.log(range(1,10));


function sumRec(arr) {
  if ( arr.length == 0 ) {
    return 0;
  }
  let last = arr[arr.length-1]

  result = sumRec(arr.slice(0, arr.length-1)) + last


  return result;
}


console.log(sumRec([1,2,3]));


function exponent1(base, exp) {
  if(exp == 0){
    return 1;
  }

  result = base * exponent1(base, exp - 1);
  return result;
}

console.log(exponent1(5, 2));



function exponent2(base, exp) {
  if(exp == 0){
    return 1;
  }
  if(exp == 1){
    return base;
  }

  if ( exp%2 == 0 )
    result = exponent2(base, exp/2) ** 2;
  else {
    result = exponent2(base, ((exp - 1) /2 ) ** 2);
  }

  return result;
}

console.log(exponent2(5,2));


function fibonacci(n){
  if(n == 1)
    return [1];
  if(n == 2)
    return [1,1];

  result= fibonacci(n-1)
  result.push(result[result.length - 1 ] + result[result.length - 2])

  return result;
}


console.log(fibonacci(10));


function bserch(arr, target){
  let mid = Math.floor(arr.length / 2);
  if(arr[mid] < target){
    const result = bserch(arr.slice(mid+1, arr.length),target)
    return result + mid+1;
  }
  if(arr[mid] == target){

    return mid;
  }
  if(arr[mid] > target){
    return bserch(arr.slice(0, mid), target)
  }
}

console.log(bserch([1,2,3,4,5,6,7], 3));

function merge_sort(left, right){
  const merged = [];

  while (left.length > 0 && right.length > 0 ){
    let item = (left[0] > right[0]) ? right.shift() : left.shift();
    merged.push(item)
  }

  return merged.concat(left, right)
}

function merge(arr){
  if ( arr.length < 2 ){
    return arr
  }else{

    const mid = Math.floor(arr.length / 2);
    const sort_left = merge(arr.slice(0, mid));
    const sort_right = merge(arr.slice(mid));
    return merge_sort(sort_left, sort_right);
  }

}

console.log(""+merge([4, 5, 2, 3, 1]));
