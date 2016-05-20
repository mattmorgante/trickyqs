# 2048.rb

# Rules of the game: 
# 1. All tiles slide through empty spaces 
# 2. All tiles with the same value combine 
# 3. After every move, an empty tile either gets 2 or 4 
# Tiles can only combine once each turn 

# Will build a "pointer" - can't combine anything outside the pointer range 
# Loops through the row, only combining once 

# Flat array or two dimensional? 
# Write one version of logic, then rotate it four ways (to represent up, down, left, and right keys)

# a = Array.new(4) { Array.new(4, 0) }
# # pass a block to array 
# a[0][0] = 1
# p a

require 'pp'
require 'stringio'


class GameOver < StandardError; end

class Board 
  attr_accessor :board, :size, :score


  MOVES = {
    'w' => 3,
    's' => 1,
    'a' => 0,
    'd' => 2
  }
  SEEDS = [2,4]

  def initialize(size=4)
    @board = Array.new(size) { Array.new(size,0) }
    @size = size
    @score = 0

    spawn_new
    spawn_new 

  end 

  def rotate!(n=1)
    @board = (0..@size-1).map {|i| @board.map{|row| row[i] }.reverse }
  end 

  def slide
    moves = 0

    # Collapse zeroes
    (0...@size).each do|row|
      (0...@size-1).each do|col|
        while @board[row][col] == 0 && @board[row][col+1..@size-1].max > 0
          @board[row][col...@size-1] = @board[row][col+1..@size-1] + [0]
          moves += 1
        end
      end
    end

    # Collapse like cells
    (0...@size).each do|row|
      (0...@size-1).each do|col|
        if @board[row][col] != 0 && @board[row][col] == @board[row][col+1]
          @board[row][col..@size-1] = @board[row][col+1..@size-1] + [0]
          @board[row][col] *= 2
          @score += @board[row][col]
          moves += 1
        end
      end
    end

    return moves
  end

  def game_over?
    if @board.flatten.include?(0)
      return false
    end

    game_over = true
    4.times do
      @board.each do|row|
        row.each_cons(2) do|nums|
          game_over = false if nums.first == nums.last
        end
      end

      rotate!
    end

    return game_over
  end

  def empty_cells
    @board.map.with_index do|row, rowidx|
      row.map.with_index do|num, colidx|
        [rowidx, colidx, num]
      end
    end.flatten(1).find_all{|cell| cell[2] == 0}
  end

  def spawn_new
    empty = empty_cells

    cell = empty.sample(1).flatten
    @board[cell[0]][cell[1]] = SEEDS.sample(1).first
  end

  def move(char)
    m = MOVES[char]
    return 0 if m.nil?

    m.times { rotate! }
    moves = slide
    (4-m).times { rotate! }

    spawn_new if moves != 0
    
    return moves
  end


  def to_s 
    cell_size = @board.flatten.max.to_s.length + 2 
    str = StringIO.new
    str.puts "Score: #{@score}"

    str.puts format_border(cell_size)

    (0...@size).each do |row|
      str.puts format_row(cell_size, row)
      str.puts format_border(cell_size)
    end 

    str.string 

  end 
  # make a string between the cells and around the board
  def format_border(cell_size)
    "+" + (['-' * cell_size] * @board.size).join('+') + "+"
  end 

  # iterate over the row
  # if it's zero, put a space 
  # if it's a number, center the number 
  # then join using | pipes. plus || two pipes on the end 

  def format_row(cell_size, row) 
    row_strings = @board[row].map do|cell| 
      if cell == 0 
        " " * cell_size 
      else 
        padding_left = (cell_size - cell.to_s.length) / 2 
        padding_right = cell_size - padding_left - cell.to_s.length  
        (" " * padding_left) + cell.to_s + (" " * padding_right) 
      end 
    end  
    "|" + row_strings.join('|') + "|" 
  end

end 

begin 

  b = Board.new

    loop do
    puts b
    raise GameOver if b.game_over?

    print "? "
    b.move gets.chomp
  end
rescue GameOver
  puts "Game over man, game over!"
  puts "Your score was: #{b.score}"
  puts
  puts
  retry
end