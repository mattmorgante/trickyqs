#Queen Object
class Queen 
  #define what the queen looks like
  @@string = 'Q'

  # can set and read queen.column and queen.row
  attr_accessor :column, :row 

  def to_s 
    @@string 
  end 

  # ask for location and get an array in return 
  def location 
    [column, row]
  end 

  # query if queen is located at this spot of xy coordinates
  def location?(x,y)
    location == [x,y]
  end 

end 