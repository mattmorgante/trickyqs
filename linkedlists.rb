# Linked lists are a series of data points strung together 
# They relate to each other, usually to the next one
# Doubly linkd lists relate forward and backward 

class Node 
  attr_accessor :node, :next 

  def initialize(node)
    @node = node
  end 

  def self.node_list(node, msg = nil)
    msg ||= ""
    return msg[0..-1] if node.nil?
    node_list(node.next, msg << "#{node.node} -> ")
  end

node = Node.new("Hello")
node_2 = Node.new("Bye")
node.next = node_2

puts Node.node_list node


# def to_s 
#   curr_node = self
#   res = "["
#   while curr_node.next_node != nil
#     res = res + curr_node.value.to_s + ","
#     curr_node = curr_node.next_node
#   end 
#   res = res + curr_node.value>to_s + "]"
# end 

#     def to_s 
#       curr_node = self
#       res = "["
#       while curr_node.next_node != nil
#         res = res + curr_node.value.to_s + ", " 
#         curr_node = curr_node.next_node
#       end
#       res = res + curr_node.value.to_s + "]"
#     end

end 

# # create a new instance of node with value 8 and next_node nil 
# head = Node.new 8, nil
# snd = Node.new 7, nil
# head.next_node = snd
# puts head