require_relative "piece"
class King < Piece
  attr_accessor :board
  def initialize(board)
    @board = board
    @positions= []
  end
  def to_s
    "\u2654".encode('utf-8')
  end
  include SteppingPiece
end
