def get_max_profit(stock_price_yesterday)
  # declare a variable we want to return 
  max_profit = 0 
  # declare a variable we want to compare prices too 
  min_price = stock_prices_yesterday[0]

  # create current_price, the value of each element in the array as we loop through it 
  stock_prices_yesterday.each do |current_price| 

    #which is smaller, min_price we declared before or the current price
    min_price = [min_price, current_price].min 

    # what would the profit be if we sold right now? 
    potential_profit = current_price - min_price 


    max_profit = [max_profit, potential_profit].max 
  end 


  return max_profit 

end 