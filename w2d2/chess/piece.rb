module SlidingPiece
  attr_accessor :positions

  def moves

  end

  def move_dirs

  end

  def rook_moves(start_pos)
    # debugger

    x,y = start_pos
    @positions << [x, y]
    x+=1

    while x <= 7 && board[[x,y]] == NullPiece.instance
      @positions << [x, y]
      x += 1
    end
    x,y = start_pos
    x-=1
    # debugger
    while x >= 0 && board[[x,y]] == NullPiece.instance
      @positions << [x, y]
      x -= 1
    end

    x,y = start_pos
    y-=1
    # debugger
    while y >= 0 && board[[x,y]] == NullPiece.instance
      @positions << [x, y]
      y -= 1
    end

    x,y = start_pos
    y+=1
    # debugger
    while y <= 7 && board[[x,y]] == NullPiece.instance
      @positions << [x, y]
      y += 1
    end

  end

  def bishop_moves(start_pos)

    x,y = start_pos
    y+=1
    x+=1
    while x <= 7 && y <= 7 && board[[x,y]] == NullPiece.instance
      @positions << [x, y]
      y += 1
      x += 1
    end

    x,y = start_pos
    y-=1
    x-=1
    while x >= 0 && y >= 0 && board[[x,y]] == NullPiece.instance
      @positions << [x, y]
      y -= 1
      x -= 1
    end

    x,y = start_pos
    y+=1
    x-=1
    while x >= 0 && y<=7 && board[[x,y]] == NullPiece.instance
      @positions << [x, y]
      y += 1
      x -= 1
    end

    x,y = start_pos
    y-=1
    x+=1
    while y >= 0 && x <= 7 && board[[x,y]] == NullPiece.instance
      @positions << [x, y]
      y -= 1
      x += 1
    end

  end



  def grow_unblocked_moves_indir(dx,dy)

  end
end

module SteppingPiece
  attr_accessor :positions
  def king_moves(start_pos)
    @positions = []
    x,y = start_pos
    @positions << [x-1, y-1] if x-1 >=0 && y-1 >=0
    @positions << [x-1, y] if x-1 >=0
    @positions << [x, y-1] if y-1 >=0
    @positions << [x+1, y+1] if x + 1 <=7 && y+1 <=7
    @positions << [x+1, y] if x + 1 <=7
    @positions << [x, y+1] if y + 1 <= 7
    @positions << [x-1, y+1] if x-1 >=0 && y+1 <=7
    @positions << [x+1, y-1] if x+1 <= 7 && y-1 >=0
  end
end
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
