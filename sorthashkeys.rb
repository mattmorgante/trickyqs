# Write a function that sorts the keys in a hash by the length of the key 

# Step 1: convert keys to strings 
# Order them by length 

hsh = {abc: 'hello', 'another_key' => 123, 4567 => 'third' }

sorted = hsh.keys.map(&:to_s).sort_by(&:length)

puts hsh
print sorted

#  OR

def key_sort hsh
  hsh.keys.collect(&:to_s).sort { |a, b| a.length <=> b.length}
end 

print key_sort hsh


