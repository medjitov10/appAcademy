class Piece
  def to_s
    self.class.name[0]
  end

  def empty?(pos)
    @grid[pos] == NullPiece
  end

  def valid_moves(pos)

  end
end

class Rock < Piece

end
class Bishop < Piece

end
class Knight < Piece

end
class King < Piece

end
class Queen < Piece

end
class Pawn < Piece

end
class NullPiece < Piece

end
