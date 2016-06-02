require_relative('eightqueens')
require_relative('queen')

def solve_queens_problem 
  # loop through the board 8 times
  @board.columns.times do |column|
    puts " \nTrying Queen ##{column+1}" if @verbose 

    @board.rows.times do |row| 
      if @board.safe_position?(column, row) 
        puts "+ Placing Queen ##{column+1} at #{column}, #{row}," if @verbose 
        @board.place_queen(column, row)
        @board.display if @verbose

        if column == @board.ending_column
          puts "! Solution Found\n" if @verbose
          @solution_found = true
          return 
        else 
          break 
        end 

      else #not a safe position
        puts "x Conflict at #{column}, #{row}" if @verbose
        if row < @board.ending_row
          next #try the next row 
        else 
          # nothing went safe 
          puts "! No Solution for Queen ##{column+1}, backtracking...." if @verbose
        end 
      end 
    end 
  end 


end 

@verbose = true
@solution_found = false 
@board = Board.new 

solve_queens_problem

if @solution_found 
  puts " \nSolution board:"
  @board.display
else 
  puts " \nNo solutions found."
end 