require "io/console"
require 'byebug'
KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board ,:arr

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @arr = []
  end

  def get_input

    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)

    case key
    when :return, :space
        # debugger
        @arr << @cursor_pos
      board.print_pos(@cursor_pos) if arr.length == 1
      if arr.length == 2
        board.move_piece(arr.first, arr.last)
        @arr = []
      end
    when :left, :right, :up, :down
      update_pos(key)
      nil
    when :ctrl_c
      Process.exit
    end

  end

  def update_pos(dif)
    diff = MOVES[dif]
    # debugger
    x, y = cursor_pos
    x1, y1 = diff
    x_new = x + x1
    y_new = y + y1
    if board.in_bounds([x_new, y_new])

      @cursor_pos = [x_new,y_new]

    end

  end
end
