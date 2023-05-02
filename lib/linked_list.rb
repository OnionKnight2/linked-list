# frozen_string_literal: true

# LinkedList class, which will represent the full list.
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    return @head = new_node if head.nil?

    current_node = head
    current_node = current_node.next_node until current_node.next_node.nil?

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
    current_node = current_node.next_node until current_node.next_node.nil?

    current_node
  end

  def at(index)
    current_node = head
    counter = 0
    return nil if index >= size

    until counter.eql?(index)
      counter += 1
      current_node = current_node.next_node
    end

    current_node
  end

  def pop
    return @head = nil if size.eql?(0) || head.next_node.nil?

    current_node = head
    current_node = current_node.next_node until current_node.next_node.next_node.nil?

    current_node.next_node = nil
  end

  def contains?(value)
    current_node = head
    until current_node.nil?
      return true if current_node.value.eql?(value)

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    index = 0
    current_node = head
    until current_node.nil?
      return index if current_node.value.eql?(value)

      index += 1
      current_node = current_node.next_node
    end

    nil
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    if index.eql?(0)
      new_node.next_node = head.next_node
      return @head = new_node
    end
    counter = 0
    current_node = head
    until (counter + 1).eql?(index)
      counter += 1
      current_node = current_node.next_node
    end

    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
  end

  def remove_at(index)
    return @head = head.next_node if index.eql?(0)

    counter = 0
    current_node = head
    until (counter + 1).eql?(index)
      counter += 1
      current_node = current_node.next_node
    end

    current_node.next_node = current_node.next_node.next_node
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

# Node class, containing a #value method and a link to the #next_node, set both as nil by default.
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

list.head.to_s

list.tail.to_s

list.at(0).to_s
list.at(4).to_s
list.at(123).to_s

list.pop
list.to_s

puts list.contains?(5)

puts list.find(-3)

list.insert_at(7, 6)
list.to_s

list.remove_at(4)
list.to_s
