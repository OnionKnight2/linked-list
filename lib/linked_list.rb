# frozen_string_literal: true
class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    return @head = new_node if head.nil?

    current_node = head
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    
    current_node.next_node = new_node
  end

  def prepend(value)
    new_node = Node.new(value, head)
    @head = new_node
  end

  def size
    current_node = head
    counter = 0
    until current_node.nil?
      counter += 1
      current_node = current_node.next_node
    end

    counter
  end

  def tail
    current_node = head
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end

    current_node
  end

  def to_s
    current_node = head
    until current_node.nil?
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node      
    end

    print "nil\n"
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    puts value
  end
end

list = LinkedList.new
list.append(5)
list.append(12)
list.append(33)
list.append(0)
list.prepend(-3)
list.prepend(66)
list.append(1)
list.prepend(-53)
list.to_s

puts list.size

puts list.head.to_s

puts list.tail.to_s