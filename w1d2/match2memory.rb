 require 'byebug'
class Card
  attr_accessor :value,:face_up
  def initialize(value)
      @face_up=false
       @value=value;
  end

  def ==(card2)
    self.value==card2.value
  end

  def hide
    @face_up=false
  end

  def reveal
    @face_up=true
  end
end

class Board
  attr_accessor :grid

  def initialize
    @grid= Array.new (4) {Array.new(4){Card.new(0)}}
  end
  def set_random_cards

    @grid.each_index do |x|
      @grid[x].each_index do |y|
          num=get_random_number
          next if @grid[x][y].value!=0
          @grid[x][y]=Card.new(num)
          new_position=new_coord
          while @grid[new_position.first][new_position.last].value!=0
            new_position=new_coord
          end
          @grid[new_position.first][new_position.last]=Card.new(num)
      end
    end
  end

  private
  def get_random_number
    number=(1..10).to_a.sample
    while !check_if_valid?(number)
      number=(1..10).to_a.sample
    end
    number
  end

  def check_if_valid?(num)
    @grid.flatten.none?{|cd| cd.value == num}
  end

  def get_coord
    (0..@grid.length-1).to_a.sample
  end

  def new_coord
    new_x=get_coord
    new_y=get_coord
    new_position=[new_x,new_y]

  end
end


class Game
  attr_accessor :board, :player
  def initialize (who)
    @player=who.new("John")

    @board=Board.new
    @board.set_random_cards
  end

  def openCard(input1)
    #debugger
    positions=input1.first
    card=@board.grid[positions.first][positions.last]

    @player.memory[positions.first][positions.last]=card.value

    card.reveal
    positions2=input1.last
    card2=@board.grid[positions2.first][positions2.last]
    @player.memory[positions2.first][positions2.last]=card2.value
    card2.reveal
    render
    if !match(card,card2)
      card.hide
      card2.hide
    end

  end
  def match(card1,card2)
    card1==card2
  end
  def take_guess
    puts
    arr=@player.take_guess
    while invalid_choise(arr.first) || invalid_choise(arr.last)
      puts 'This position alredy open, try another one'
      arr=@player.take_guess
    end
    puts
    # arr2=@player.take_guess
    # while invalid_choise(arr2.first) || invalid_choise(arr2.last)
    #   puts 'This position alredy open, try another one'
    #   arr2=@player.take_guess
    # end
    openCard(arr)
  end

  def invalid_choise(arr)
    puts arr.first
    @board.grid[arr.first][arr.last].face_up
  end
  def won?
    self.board.grid.flatten.all? { |card| card.face_up  }
  end
  def render
    system("clear")
    @board.grid.each do |row|
      puts
      print " -----------"
      puts
      print "|"
      row.each do |pos|
        if pos.face_up
          print "#{pos.value} |"
        else
          print ("# |")
        end
      end
    end
  end
  def play
    #
    count = 0
    until won?
      count+=1
      take_guess


    end
      puts
      puts "Congratilation you win by #{count} tries"

  end

end
class HumanPlayer
  attr_accessor :name,:memory
  def initialize(name)
    @memory = Array.new(4){Array.new(4){0}}
    @name=name
  end
  def take_guess
    puts "choose a position on the grid"
    input=gets.chomp
    puts "choose a position on the grid"
    input2=gets.chomp
    arr1=input.split(",").map(&:to_i)
    arr2=input2.split(",").map(&:to_i)
    returnArray =[]
    returnArray<< arr1
    returnArray<< arr2
  end
  def indicator
    "human"
  end
end

class ComputerPlayer
  attr_accessor :memory
  def initialize(name)
    @name=name
    @memory = Array.new (4) {Array.new(4){0}}
  end

  def take_guess
    @memory.flatten.each_index do |i|
      j=i+1

      while j<@memory.flatten.length
        if (@memory.flatten[i]==@memory.flatten[j]) && (@memory.flatten[i]!=0) && @memory.flatten[j]!=-1 && @memory.flatten[i]!=-1
          puts "hhh"
          x1=i/@memory.length
          y1=i% (@memory.length)
          x2=j/@memory.length
          y2=j% (@memory.length)
          @memory[x1,y1]=-1
          @memory[x2,y2]=-1
          return [[x1,y1],[x2,y2]]
        end
        j+=1
      end
    end

    #if didnt find match choose random
    x1=(0..3).to_a.sample
    y1=(0..3).to_a.sample
    x2=(0..3).to_a.sample
    y2=(0..3).to_a.sample
    return [[x1,y1],[x2,y2]]

  end

end

   if __FILE__ == $PROGRAM_NAME
   game=Game.new(ComputerPlayer)
   game.play
 end
