# one queen per column and one queen per row 
# display the results as a chess board 

class Board 
  DEFAULT_SIZE = 8 

  # declare these for the display method 
  @@h_edge = '='
  @@v_edge = '|'
  @@blank  = '-'
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
    rows - 1 
  end 

  def columns 
    @size
  end 

  # easy to change if we want to later 
  def starting_column 
    0 
  end 


  def ending_column 
    columns - 1 
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

  def display 
  # enables us to display board to the command line
    puts
    # defines a class variable that is the top border of the board 
    # + 2 is for the vertical edges 
    puts @@h_edge * (columns + 2)
    # create a loop,
    rows.times do |row|
    # print doesn't do a line return
      print @@v_edge
      columns.times do |column|
        # check contents_at method
        print contents_at(column, row)
      end 
      # this time with a line return 
      puts @@v_edge
    end 
    puts @@h_edge * (columns + 2)
    puts
  end 

  # Step 3: Safe Positions
  # Are there any queens in the same row? same diagonal? same column?

  def safe_position?(column, row)
    return false unless safe_column?(column)
    return false unless safe_row?(row)
    return false unless safe_diagonal?(column, row)
    return true
  end  

  private 

    def find_queen(column, row)
      # looks for location that matches column and row 
      @queens.detect {|q| q.location?(column, row)}
      # if it doesn't find a queen, sets to nil 
    end


    def contents_at(column, row)
      # does it find a queen at that coordinate? if not, prints a blank mark
      find_queen(column, row) || @@blank 
    end 

    def safe_column?(column)
      # is it true that none of the queens satisfy this condition
      queens.none? { |q| q.column == column}
    end 

    def safe_row?(row)
      queens.none? { |q| q.row == row }
    end 

    def safe_diagonal?(column, row)
      # if the absolutely value of the difference between the columns and the absolute value of the difference between the rows are equal, then they're in the diagonal 
      queens.none? do |q|
        (q.column - column).abs == (q.row - row).abs
      end  
    end 
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