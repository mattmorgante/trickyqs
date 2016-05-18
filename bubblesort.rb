# Each pair of adjacent elements are compared and swapped if they are not in order 

# Horrible for large data sets 

a = [14,33,27,35,10]
puts a 

def bubble_sort(array)
  n = array.length
  loop do 
    swapped = false

    (n-1).times do |i|
      #compare
      if array[i] > array[i+1]
        #swap 
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end 
    end 

    break if not swapped 
  end 

  return array
end 

puts "now sorted"
puts bubble_sort a