require_relative "piece"
class Pawn < Piece
  def to_s
    "\u2659".encode("utf-8")
  end
end
