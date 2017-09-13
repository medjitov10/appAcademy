
require_relative "bishop"
require_relative "king"
require_relative "knight"
require_relative "null"
require_relative "pawn"
require_relative "queen"
require_relative "rock"

require 'byebug'
class Board
  attr_accessor :grid
  def initialize
    @grid =[]
  end
  def set_grid
    @grid = [
      [Rock.new(self), Knight.new, Bishop.new(self), King.new(self), Queen.new(self), Bishop.new(self), Knight.new, Rock.new(self)],
      [Pawn.new,Pawn.new,Pawn.new,Pawn.new,Pawn.new,Pawn.new,Pawn.new,Pawn.new],
      [NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance],
      [NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance],
      [NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance],
      [NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance,NullPiece.instance],
      [Pawn.new,Pawn.new,Pawn.new,Pawn.new,Pawn.new,Pawn.new,Pawn.new,Pawn.new],
      [Rock.new(self), Knight.new, Bishop.new(self),King.new(self), Queen.new(self), Bishop.new(self), Knight.new, Rock.new(self)]
    ]
  end

  def print_pos(position)
    if self[position].class == Queen
      self[position].positions = []
      self[position].rook_moves(position)
      self[position].bishop_moves(position)
      # debugger
      print "#{self[position].positions }"
    end
    if self[position].class == Rock
      self[position].positions = []
      self[position].rook_moves(position)
      print "#{self[position].positions }"
    end
    if self[position].class == Bishop
      self[position].positions = []
      self[position].bishop_moves(position)
      print "#{self[position].positions }"
    end

    if self[position].class == King
      self[position].king_moves(position)
      print "#{self[position].positions }"
    end
  end

  def move_piece(start_pos, end_pos)

    if self[start_pos].class == Pawn
      self[end_pos] = self[start_pos]
      self[start_pos] =  NullPiece.instance
    else

      if self[start_pos].positions.include?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
      end

    end

  end

  def in_bounds(pos)
    # debugger
    return true if pos.all?{|el| el >= 0 && el <=7}
    false
  end
  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end



end
