class Node
  attr_reader :element
  attr_accessor :next_node

  def initialize(element, next_node)
    @next_node = next_node
    @element = element
  end
end

class SinglyLinkedList
  attr_accessor :head, :tail, :size

  def initialize(head_element)
    @size = 1
    @head = Node.new(head_element, nil)
    @tail = head
  end

  def is_empty
    @size == 0
  end

  def first
    !is_empty ? @head.element : nil
  end

  def last
    !is_empty ? @tail.element : nil
  end

  def add_first(element)
    @head = Node.new(element, @head)

    @tail = head if is_empty
    @size += 1
    @head
  end

  def add_last(element)
    new_node = Node.new(element, nil)

    if is_empty
      @tail = new_node
      @head = @tail
    else
      @tail.next_node = new_node
      @tail = new_node
    end

    @size += 1
    @tail
  end

  def delete(element)
    current = head

    return remove_first if (current && current.element == element)

    (0..size - 2).each do
      if (current.next_node.element == element)
        current.next_node = current.next_node.next_node
        @size -= 1
        return element
      end
      current = current.next_node
    end
  end

  def remove_first
    return nil if is_empty

    to_remove = head
    @head = head.next_node
    @size -= 1

    @tail = nil if is_empty
    to_remove
  end

  def to_string
    list = ""
    current = @head
    (0..size - 1).each do
      list += "#{current.element};"
      current = current.next_node
    end
    list.split(";").join(" --> ")
  end
end
