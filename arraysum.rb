# array of n integers 
puts "Enter number of elements:"
puts "Enter elements:"

n = gets.to_i
puts gets.split(" ").map(&:to_i).inject(:+)