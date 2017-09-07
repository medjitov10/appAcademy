class Game
  attr_accessor :fragment, :player_1, :player_2, :dictionary, :current_player, :players

  def initialize(player_1, player_2)

    @fragment = ''
    @player_1 = player_1
    @current_player = player_1
    @player_2 = player_2
    @players = [player_1, player_2]
    @dictionary = File.readlines('dictionary.txt').map(&:strip!)
  end

  def won?
    dictionary.include?(fragment)
  end

  def play_round
    players.each do |player|
      puts "#{player.game_word[0..player.losess-1]}" unless player.losess.zero?
    end
    until won?
      take_turn(current_player)
      switch_player
    end
    players.last.losess+=1
    puts "#{current_player.name} Wins"
    @fragment = ''
  end

  def switch_player
    current_player = players.reverse[0]
  end

  def valid_letter?(letter)
    temp = "#{fragment}#{letter}"
    dictionary.any?{|el| el.match(/^#{temp}/)}
  end

  def take_turn(player)
    puts "Write the letter mr. #{current_player.name}"
    puts "Fragment is #{fragment}" unless fragment.empty?

    letter = player.get_play

    until valid_letter?(letter)
      puts "Illegal move!!!!!"
      letter = player.get_play
    end
    fragment << letter
  end

  def play
    until over?
      play_round
    end
    puts "#{current_player.name} losess"
  end

  def over?
    players.any? { |player| player.losess == 5 }
  end


end

class Player
  
  attr_accessor :name, :losess, :game_word

  def initialize(name)
    @name = name
    @game_word="GHOST"
    @losess = 0
  end

  def get_play
    letter = gets.chomp
  end

end



if __FILE__ == $PROGRAM_NAME
  Game.new(Player.new("John"), Player.new("Steave")).play
end
