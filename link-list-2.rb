class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

  # Passing two aurguments(linked list and previous node)
  # when making the initial call to this method we need to start at the head and not pass the second argument
  # the second aurgument will only be used during the recursion
  def reverse_list(list, previous=nil)
  # The if statement within this method is used to see if we have a linked list or not
  # It is also how we know when we've reached the end of the linked list
    if list
  # store the next_node which will become our list for the recursion
      next_node = list.next_node
  # Then set the list.next_node to be the previous node(this will start as nill)
      list.next_node = previous
  # The method reverse_list is calling itself and passing two arguments
  # The next_node which we defined above and what we want to be the previous node which is the current list.
      reverse_list(next_node, list)
    end
  end

  def print_values(list_node)
    if list_node
      print "#{list_node.value} --> "
      print_values(list_node.next_node)     #this is where the recurision is happening by calling print_values inside the print_values method
    else
      print "nil\n"
      return
    end
  end

  def infinite_loop?(list)
    # the infinite loop method sets the tortoise and the hare to the first next_node
    tortoise = list.next_node
    hare = list.next_node

    #the until loop will run untill hare.nil(until we reach the end of the linked list)
    until hare.nil?
      hare = hare.next_node
      return false if hare.nil?
    # make the hare take 2 steps(1 at a time) forward by setting its value to the next_node
    # for each 1 step the tortoise takes
      hare = hare.next_node
      tortoise = tortoise.next_node
    # return if the hare reaches the end of the linked list or if the hare catches the tortoise
    # by comparing them if hare == tortoise
      return true if hare == tortoise
    end
    # because the list is in an infinite loop we need to make sure we return out of the loop 
    return false
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
print_values(node1)

puts infinite_loop?(node3)
node1.next_node = node3
puts infinite_loop?(node3)




