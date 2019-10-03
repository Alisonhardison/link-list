class LinkedListNode
  attr_accessor :value, :nextNode

  def initialize(value, nextNode=nil)
    @value = value
    @nextNode = nextNode
  end
end

  def print_values(list_node)
    if list_node
      print "#{list_node.value} --> "
      print_values(list_node.nextNode)
    else
      print "nil\n"
      return
    end
  end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

    # Push a value onto the stack it will create a new LinkListNode using the value.
    #The pointer will become what @data was previously(nil or a previous pushed linklistnode)
  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

    # Pop an item off the stack
    # When we pop from the stack it prints @data.value which is at the top of the stack
    # Then it will set the stack to be the nextNode removing the LinkListNode from the stack
    # Return the value to the user
  def pop
    return nil if @data.nil?
      returning_value = @data.value
      @data = @data.nextNode
      returning_value
  end
end
  
  # Create an instance of Stack (stack = Stack.new) an empty stack
  # Then do push and pop operation using this instance
  def reverse_list(list)
    stack = Stack.new
    while list
      stack.push(list.value)
      list = list.nextNode
    end
    LinkedListNode.new(stack.pop, stack.data)
  end
  
  

#Create a LinkedListNode instance with value 36
node1 = LinkedListNode.new(37)
#Create a linkedListNode instance which next value is node1
node2 = LinkedListNode.new(99, node1)
#node2 -> node1
#Create a Linked ListNode instance which next value is node2
node3 = LinkedListNode.new(12, node2)
#node3 -> node2 ->node1

print_values(node3)
#12 -> 99 -> 37
puts "------------------------"

revlist = reverse_list(node3)
print_values(revlist)

#creates a new Stack Object
#stack = Stack.new

puts "------------------------"
#Pushes (adds) the number 1 to the empty stack
#stack.push(1)

#Pushes the number 2 to the top of the stack
#stack.push(2)

#Pops (removes) the top number from the stack (2)
#puts stack.pop    #=>2

#Pops the remaining number from the stack (1)
#puts stack.pop    #=>1

#Tries to pop the Top number from the stack,
#but it is empty so it retuns nil
#puts stack.pop    #=> 0