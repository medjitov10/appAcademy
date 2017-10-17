const Game = require('./tower_of_hanoi.js');
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


let g = new Game();
g.run(reader, callback);

function callback(){
  reader.question("Play again? y or n: ", restartGame => {
    if (restartGame === "y") {
      g = new Game();
      g.run(reader, callback);
    } else {
      reader.close();
    }
  });
};
