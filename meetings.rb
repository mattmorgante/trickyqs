m = [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]

def merge_ranges(meetings)
  sorted = meetings.sort 

  merged_meetings = [sorted[0]]

  sorted[1..-1].each do |c, d|
    a, b = merged_meetings[-1]

    if c <= b
      merged_meetings[-1] = [a, [b, d].max]
    else 
      merged_meetings.push([c, d])
    end 
  end 
  return merged_meetings
end 

print merge_ranges(m)