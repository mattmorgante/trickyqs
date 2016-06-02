class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
      @value = value
      @left  = nil
      @right = nil
  end

  def insert_left(value)
      @left = BinaryTreeNode.new(value)
      return @left
  end

  def insert_right(value)
      @right = BinaryTreeNode.new(value)
      return @right
  end
end

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

root = BinaryTreeNode.new(1)
two = root.insert_right(2)
three = two.insert_right(3)
four = three.insert_right(4)
five = root.insert_left(5)

puts is_balanced root