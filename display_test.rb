# ruby

require_relative('eightqueens')
require_relative('queen')

@board = Board.new

@board.place_queen(0,0)
@board.place_queen(1,1)
@board.place_queen(2,6)
@board.place_queen(3,4)
@board.place_queen(4,2)
@board.place_queen(5,3)
@board.place_queen(6,7)
@board.place_queen(7,5)

@board.display