stock_price_yesterday = [5,4,8,2]


  if stock_price_yesterday.length < 2 
    raise IndexError, 'Need at least 2 prices'
  end 
  # declare a variable we want to compare prices too 
  min_price = stock_price_yesterday[0]
  # declare a variable we want to return 
  # max_profit must start at the first possible profit
  max_profit = stock_price_yesterday[1] - stock_price_yesterday [0]

  # create current_price, the value of each element in the array as we loop through it 
  stock_price_yesterday.each_with_index do |current_price, index|

    # skip the first element, can't buy and sell at the same time
    if index == 0 
      then next
    end  

    # what would the profit be if we sold right now? 
    potential_profit = current_price - min_price 


    max_profit = [max_profit, potential_profit].max

    #which is smaller, min_price we declared before or the current price
    #min_price goes last so that we're never buying at current_price
    min_price = [min_price, current_price].min 
  end 


puts max_profit 
