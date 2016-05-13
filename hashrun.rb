# Hash tables are instances of the hash object 
# Problem: remove duplicates from an array 

# Put each number in a hash table, return the keys 
a = ["aa","b",3,3,4,5]

def remove_duplicates(list)
  # create an empty hash 
  set = {}
  # for each element in the array 
  list.each do |el|
  # checks if element is already in 
    set[el] = 1
  end 
  set.keys
end 

puts remove_duplicates a
