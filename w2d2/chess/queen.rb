require_relative "piece"
class Queen < Piece
  attr_accessor :board
  def initialize(board)
    @board = board
    @positions= []
  end
  def to_s
    "\u2655".encode("utf-8")
  end

  include SlidingPiece
end
