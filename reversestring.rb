# reverse returns a new array containing the elements in reverse order 

# reverse! reverses the array in place, changing the value of the original array 

# how to do this manually: 

class String
  def reverse_inplace! 
    half_length = self.length / 2 
      half_length.times do |i| 
        self [i], self[-i-1] = self[-i-1], self [i]
      self
      end
  end

  def reverse(string)
    reversed_string = ""

    i = 0 
    while i < string.length 
      reversed_string = string[i] + reversed_string

      i += 1 
    end  

    return reversed_string
  end 
end 


def reverse(string)
  reversed_string = ""

  i = 0 
  while i < string.length 
    reversed_string = string[i] + reversed_string

    i += 1 
  end  

  return reversed_string
end 
s = "abc"
reverse s 

# Call within a class 
a = "abcd"
a.reverse_inplace!
puts a 



