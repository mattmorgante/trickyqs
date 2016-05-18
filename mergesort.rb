def merge_sort(array)
  return array if array.length <= 1
 
  middle = array.length / 2
  left = array[0, middle]
  right = array[middle..-1]
 
  left = merge_sort(left)
  right = merge_sort(right)
  return merge(left, right)
end
 
def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end
 
a = [7,6,5,9,8,4,3,1,2,0]
p merge_sort(a) 