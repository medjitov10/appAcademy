require_relative "piece"
class Knight < Piece
  def to_s
    "\u265E".encode("utf-8")
  end
end
