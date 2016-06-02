# one queen per column and one queen per row 
# display the results as a chess board 

# Queen Object 
class Queen 
  # can set and read queen.column and queen.row
  attr_accessor :column, :row 

  # ask for location and get an array in return 
  def location 
    [column, row]
  end 

  # query if queen is located at this spot of xy coordinates
  def location?(x,y)
    locaton == [x,y]
  end 

end 

class Board 
  DEFAULT_SIZE = 8 
  # set or read value of queens 
  attr_accessor :queens

  def initialize(options={})
    @size = options[:size] || DEFAULT_SIZE
    # initialize queens as an empty array
    @queens = []
  end 

  def rows 
    @size 
  end 

  def starting_row 
    0 
  end 

  def ending_row 
    rows -1 
  end 

  def columns 
    @size
  end 

  # easy to change if we want to later 
  def starting_column 
    0 
  end 


  def ending_column 
    columns -1 
  end 


  def place_queen(column=0, row=0)
    queen = Queen.new
    # add it to an array of queens  
    @queens << queen
    # from queen class
    queen.column = column  
    queen.row = row 
    return queen 
  end 

  def remove_queen(column, row)
    # private method that only remove_queen can use 
    queen = find_queen(column, row)
    if queen 
      queen.column = nil
      queen.row = nil 
      @queens.delete(queen)
    end 
  end  

  private 

    def find_queen(column, row)
      # looks for location that matches column and row 
      @queens.detect { |q| q.location?(column,row)}
      # if it doesn't find a queen, sets to nil 
    end


# Board Object 
# Columns, rows, position safe? 

# How to place queens on the board? 

# Display the board 

# Logic for safe positions 

# Add queens to safe positions 
# Sometimes must backtrack when attempted solutions don't work out 

# Find all 92 solutions 

# Can solve with either loops or recursion 