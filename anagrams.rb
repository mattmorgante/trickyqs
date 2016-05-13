# Determine if two strings are anagrams 
# Do they have the same frequencies of the same characters? 

a = "stefjeroordink"
b = "forjeskitdrone"

def anagram(str)
  # create a new blank hash named freq 
  freq = Hash.new(0)
  str.each_char do |x|
    # passing through the string from the argument

    freq[x] += 1 
  end 
  # same hash 
  freq 

end 

def check_anagram(str1, str2)
  anagram(str1) == anagram(str2)
end 

puts check_anagram a,b