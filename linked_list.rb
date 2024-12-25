# frozen_string_literal: true

require_relative 'node'

# class LinkedList
class LinkedList # rubocop:disable Metrics/ClassLength
  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    temp = Node.new(value)
    temp.next_node = @head
    @head = temp
  end

  def append(value) # rubocop:disable Metrics/MethodLength
    temp = Node.new(value)
    if @head.nil?
      temp.next_node = @head
      @head = temp
    elsif @tail.nil?
      @tail = temp
      @head.next_node = @tail
    else
      @tail.next_node = temp
      @tail = temp
    end
  end

  def size
    list_size = 0
    temp = head
    loop do
      list_size += 1
      break if temp.next_node.nil?

      temp = temp.next_node
    end
    list_size
  end

  def to_s
    temp = head
    loop do
      print "( #{temp.value} ) -> "
      if temp.next_node.nil?
        print 'nil'
        puts
        break
      end

      temp = temp.next_node
    end
  end

  def at(index)
    list_size = 0
    temp = head
    loop do
      list_size += 1
      return temp if index + 1 == list_size

      return "Node with this index doesn't exits" if temp.next_node.nil?

      temp = temp.next_node
    end
  end

  def pop
    prev_last = at(size - 2)
    prev_last.next_node = nil
    last = @tail
    @tail = prev_last
    last
  end

  def contains?(value)
    temp = head
    loop do
      return true if temp.value == value

      return false if temp.next_node.nil?

      temp = temp.next_node
    end
  end

  def find(value)
    index = 0
    temp = head
    loop do
      index += 1
      return index - 1 if temp.value == value

      return nil if temp.next_node.nil?

      temp = temp.next_node
    end
  end

  def insert_at(value, index) # rubocop:disable Metrics/MethodLength
    if index.zero?
      prepend(value)
      return
    elsif size - 1 == index
      append(value)
      return
    end
    new_node = Node.new(value)
    target_node = at(index - 1)
    temp = target_node.next_node
    new_node.next_node = temp
    target_node.next_node = new_node
  end

  def remove_at(index) # rubocop:disable Metrics/MethodLength
    if index.zero?
      new_head = @head.next_node
      @head = new_head
      return
    elsif size - 1 == index
      new_last = at(size - 2)
      new_last.next_node = nil
      @tail = new_last
      return
    end
    prev_target_node = at(index - 1)
    target_node = at(index)
    prev_target_node.next_node = target_node.next_node
  end

  attr_reader :head, :tail
end
