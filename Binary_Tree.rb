class TreeNode
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add(value)
    if @root == nil
      @root = TreeNode.new(value)
    else
      current_node = @root
      while current_node != nil
        previous_node = current_node
        if value < current_node.value
          current_node = current_node.left
        else
          current_node = current_node.right
        end
      end
      if value < previous_node.value
        previous_node.left = TreeNode.new(value)
      else
        previous_node.right = TreeNode.new(value)
      end
    end
  end

  def delete(value, node = self.root)
    return if node == nil
    return if include?(value, node) == false
    if value > node.value
      node.right = delete(value, node.right)
    elsif value < node.value
      node.left = delete(value, node.left)
    else
      case
      when node.left == nil && node.right == nil then node = nil #deletion of the node with no child
      when node.left != nil && node.right == nil then node = node.left #deletion of the node with 1 child
      when node.left == nil && node.right != nil then node = node.right
      when node.left != nil && node.right != nil #deletion of the node with 2 children
        max_of_left_subtree = find_max(node.left)
        node.value = max_of_left_subtree
        node.left = delete(max_of_left_subtree, node.left)
      end
    end
    return value
  end

  def find(value, node = self.root)
    if node == nil
      return
    elsif value < node.value
      return find(value, node.left)
    elsif value > node.value
      return find(value, node.right)
    else
      return value
    end
  end

  def clear
    self.root = nil
  end

  private

  def find_max(node = self.root)
    if node == nil
      return nil
    elsif node.right == nil
      return node
    end
    return find_max(node.right)
  end

  def include?(value, node = self.root)
    if node == nil
      return false
    elsif value < node.value
      return include?(value, node.left)
    elsif value > node.value
      return include?(value, node.right)
    else
      return true
    end
  end

end

tree = BinaryTree.new

=begin
tree.add(12)
tree.add(6)
tree.add(18)
tree.add(3)
tree.add(9)
tree.add(20)
tree.add(7)
tree.add(11)
tree.delete(6)
tree.clear
=end

tree.add(10) #=> 10
tree.add(20) #=> 20
tree.add(30) #=> 30
p tree

p tree.delete(10) #=> 10
p tree.delete(25) #=> nil

p tree.find(20) #=> 20
p tree.find(26) #=> nil