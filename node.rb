# frozen_string_literal: true

# class Node
class Node
  def initialize(value)
    @value = value
    @next_node = nil
  end

  attr_accessor :value, :next_node
end