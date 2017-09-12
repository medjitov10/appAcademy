require_relative 'Piece.rb'

class Board
  attr_accessor :grid
  def initialize
    @grid =[
      [[Rock.new],[Bishop.new],[Knight.new],[King.new],[Queen.new],[Knight.new],[Bishop.new],[Rock.new]],
      [[Pawn.new],[Pawn.new],[Pawn.new],[Pawn.new],[Pawn.new],[Pawn.new],[Pawn.new],[Pawn.new]],
      [[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new]],
      [[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new]],
      [[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new]],
      [[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new],[NullPiece.new]],
      [[Pawn.new],[Pawn.new],[Pawn.new],[Pawn.new],[Pawn.new],[Pawn.new],[Pawn.new],[Pawn.new]],
      [[Rock.new],[Bishop.new],[Knight.new],[King.new],[Queen.new],[Knight.new],[Bishop.new],[Rock.new]]
    ]
  end

  def move_piece(start_pos, end_pos)
    @grid[end_pos] = @grid[start_pos].first
    @grid[start_pos]= NullPiece.new
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def render
    @grid.each do |line|
      line.each do |el|
        print "#{el.first.class.name[0]} "
      end
      puts
    end
    nil
  end

end
