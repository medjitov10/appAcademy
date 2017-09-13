require_relative 'Cursor.rb'
require_relative 'Board.rb'
require 'byebug'
require 'colorize'
class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def get_input
    @cursor.get_input
  end

  def render

    @board.grid.each_with_index do |el,x|

      el.each_index do |y|
        print "|" if y == 0
        #  debugger
        if [x,y] == @cursor.cursor_pos
          print "#{@board[[x,y]]} |".colorize(:red)
        
        else
          print "#{@board[[x,y]]} |" if @board[[x,y]].class !=NullPiece
          print "  |" if @board[[x,y]].class ==NullPiece
        end
      end
      puts
      p "-----------------------"

    end
    nil
  end
end


b = Board.new
b.set_grid
d = Display.new(b)
while true
  system("Clear")
  d.render
  d.get_input
end
