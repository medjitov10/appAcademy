require_relative "piece"
class Bishop < Piece
  attr_accessor :board
  def initialize(board)
    @board = board
    @positions= []
  end
  include SlidingPiece
  def to_s
    "\u265D".encode("utf-8")
  end
end
