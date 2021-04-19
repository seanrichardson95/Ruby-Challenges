=begin

Write a simple linked list implementation. The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.

The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide functions to reverse the linked list and convert a linked list to and from an array.

Notes:
-linked list is a data structure
-singly linked list:
  -each element in the list contains data and a "next" field pointing to the next element in the list of elements
-Create linked list whose elements may contain a range of data such as the numbers 1-10.
-Create functions to reverse the linked list
-function of convert linked list to and from array

-linked list is made up of elements

=end
require 'pry'

class Element
  attr_reader :datum
  
  def initialize(datum, link=nil)
    @datum = datum
    @link = link
  end
  
  def tail?
    @link.nil?
  end
  
  def next
    tail? ? nil : @link
  end
end

class SimpleLinkedList
  def initialize
    @elements = []
  end
  
  def self.from_a(arr)
    list = SimpleLinkedList.new
    return list if arr.nil?
    arr.reverse.each {|element| list.push(element)}
    list
  end
  
  def push(datum)
    if empty?
      @elements.unshift Element.new(datum)
    else
      @elements.unshift Element.new(datum, @elements.first)
    end
  end
  
  def empty?
    @elements.empty?
  end
  
  def reverse
    new_list = SimpleLinkedList.new
    @elements.each {|el|
      new_list.push(el.datum)
    }
    new_list
  end
  
  def to_a
    @elements.map {|el| el.datum}
  end
  
  def size
    @elements.size
  end
  
  def peek
    empty? ? nil : @elements.first.datum
  end
  
  def head
    @elements[0]
  end
  
  def pop
    @elements.shift.datum
  end
end