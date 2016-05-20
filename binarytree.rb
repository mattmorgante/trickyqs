module BinaryTree
  class Node 
    attr_reader :value
    attr_accessor :left, :right

    def initialize(v)
      @value = v
    end 
  end 

end 

tree = BinaryTree::Node.new(10)
tree.left = BinaryTree::Node.new(5)
tree.left = BinaryTree::Node.new(15)
tree.left = BinaryTree::Node.new(25)
tree.left = BinaryTree::Node.new(35)
tree.left = BinaryTree::Node.new(15)

def is_balanced(tree)
  depths = [] 
  nodes = []
  nodes.push([tree, 0])

  while !nodes.empty?
      node, depth = nodes.pop
      if !node.left && !node.right
          if !depths.include? depth
              depths.push(depth)
              if (depths.length > 2) || \
                      (depths.length == 2 && (depths[0] - depths[1]).abs > 1)
                  return false
              end
          end
      else
          if node.left
              nodes.push([node.left, depth + 1])
          end
          if node.right
              nodes.push([node.right, depth + 1])
          end
      end
  end
  true
end

puts is_balanced(tree)
