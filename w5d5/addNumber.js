const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsleft, completionCallback){

  function read(){
    reader.question('Press number u want to add: ', (res) => {
      sum+=parseInt(res);
      console.log(sum);

      numsleft--;
      if (numsleft > 0) {
        read();
      }
      else{
        completionCallback(sum)
        reader.close();
      }
    })
  }

  read();


}




addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
