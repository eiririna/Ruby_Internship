require_relative 'Node'

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if self.is_empty?
      @head = Node.new(value)
    else
      current_node = @head
      new_node = Node.new(value)
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = new_node
    end
  end

  def find(value)
    nil if self.is_empty?
    current_node = @head
    return current_node if current_node.value == value
    while current_node.next != nil
      next_node = current_node.next
      if next_node.value == value
        return next_node
      end
      current_node = current_node.next
    end
  end

  def append_after(value, next_value)
    current_node = find(value)
    return if !current_node
    old_node = current_node.next
    next_node = Node.new(next_value)
    current_node.next = next_node
    next_node.next = old_node
  end

  def delete(value)
    return if self.is_empty?
    return self if self.include?(value) == false
    current_node = @head
    if current_node.value == value
      new_head = @head.next
      current_node.next = nil
      @head = new_head
      return self
    end
    while (current_node.next).value != value
      current_node = current_node.next
    end
    previous_node = current_node
    current_node = previous_node.next
    next_node = current_node.next

    previous_node.next = next_node
    current_node.next = nil
    return self
  end

  def to_s
    node = @head
    str = "(#{node.value}"
    while (node = node.next)
      str += ", #{node.value}"
    end
    str += ")"
    return str
  end

  private

  def is_empty?
    if @head == nil
      return true
    else
      return false
    end
  end

  def include?(value)
    node = @head
    bool = false
    begin
      if node.value == value
        bool = true
      end
    end while (node = node.next)
    return bool
  end
end

list = LinkedList.new

list.append(3)
list.append(5)
list.append(10)
puts list.to_s #=> (3, 5, 10)
p list.find(3) #=> 3
p list.find(25) #=> nil
p list.find(10) #=> 10

list.append_after(3, 15)
p list.to_s #=> (3, 15, 5, 10)
list.append_after(10, 25)
p list.to_s #=> (3, 15, 5, 10, 25)

p list.delete(5).to_s #=> (3, 15, 10, 25)
p list.delete(3).to_s #=> (15, 10, 25)
p list.delete(125).to_s #=> (15, 10, 25)
p list.delete(25).to_s #=> (15, 10)

