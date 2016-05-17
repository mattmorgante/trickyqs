a = [1,3,5].inject { |result, element| result + element }

puts a
# 9 
b = [1,3,5,7].inject { |product, element| product * element }
puts b