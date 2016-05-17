int_array = [1,2,6,5,9]

  products_of_all_ints_except_at_index = []

  product_so_far = 1 
  i = 0

  while i < int_array.length
    # while i is less than the length, we're going to make the new array = product_so_far
    products_of_all_ints_except_at_index[i] = product_so_far
    # product_so_far is equal to....
    # multiplying the product by the i-th volume of int_array, the argument we're passing 
    product_so_far *= int_array[i]
    # at the end of this method, we move forward to the next element in the array 
    i += 1
  end 

  product_so_far = 1 
  i = int_array.length - 1 
  while i >= 0 
    products_of_all_ints_except_at_index[i] *= product_so_far
    product_so_far *= int_array[i]
    i -= 1
  end 

  puts products_of_all_ints_except_at_index

