const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback){
  reader.question(`${el1} is greater then ${el2}? `, (responce) => {
    answer = responce;
    callback(answer == 'yes' ? true : false);
  })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {

  result_of_itteration = askIfGreaterThan(arr[i], arr[i+1], res => {
    if(res){
      let tmp = arr[i];
      arr[i] = arr[i+1];
      arr[i + 1] = tmp;
      madeAnySwaps = true;
    }

    if(i < arr.length - 2){
      innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop)
    }
    else{
      outerBubbleSortLoop(madeAnySwaps)
      return;
    }

  });


}

function absurdBubbleSort(arr, sortCompletionCallback) {

  function outerBubbleSortLoop(madeAnySwaps) {
    if(madeAnySwaps){
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    }
    else{
      sortCompletionCallback(arr);
    }
  }
  madeAnySwaps = true;
  outerBubbleSortLoop(madeAnySwaps);
}


absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
