class Array
  def selection_sort
    sorted_array = Array.new
    sorted_array << self.delete_at(self.index(self.min)) while self.length > 0
    self.replace(sorted_array)
  end
end

array = [3,2,1,4,5]
print array.selection_sort

class Array
  def selection_sort_two
    (0..self.length-1).each do |i|
      min = i
      (i+1..self.length-1).each do |j|
        min = j if self[j] < self[min]
      end
      self[i], self[min] = self[min], self[i]
    end

    self
  end
end

a = [4,3,1,2,5]
print a.selection_sort_two