require_relative "piece"

class Rock < Piece
  attr_accessor :board
  include SlidingPiece

  def initialize(board)
    @board = board
    @positions= []
  end

  def to_s
    "\u265C".encode("utf-8")
  end

end
