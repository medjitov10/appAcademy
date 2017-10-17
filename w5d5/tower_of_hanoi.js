class Game{
  constructor(){
    this.board =[
      [3,2,1],
      [],
      [],
    ]
  }

  moveBlock(to, from){
    this.board[to].push(this.board[from].pop())
  }

  validMove(to,from){
    if(this.board[from][this.board[from].length-1] > this.board[to][0] || this.board[from].length == 0){
      return false;
    }
    return true;
  }

  promptMove(reader, run_callback){
    this.render();
    reader.question('Write number of block which you want to move: ', res => {
      let from = parseInt(res)-1;
      reader.question('Write number of block where you want to move block: ', res => {
        let to = parseInt(res)-1;
        run_callback(to, from)
      })
    })
  }

  render(){
    console.log(JSON.stringify(this.board));
  }

  won() {
    return this.board[2].length == 3
  }

  run(reader, game_callback){

    this.promptMove(reader, (to,from) =>{
      if (this.validMove(to, from)) {
        this.moveBlock(to, from);
      } else {
        console.log('something went wrong');
      }
      if (!this.won()) {
        this.run(reader, game_callback);
      } else {
        this.render()
        console.log('Congratulation you won this game!');
        game_callback();
      }
    })


  }
}

module.exports = Game
