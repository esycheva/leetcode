
###
# Вам даны два непустых связных списка, которые представляют два положительных числа. 
# Цифры хранятся в обратном порядке, и каждый узел содержит одну цифру.
# Добавьте два числа и верните сумму чисел в виде связного списка.
# 2 -> 4 -> 3
# 5 -> 6 -> 4
# ---------
# 7 -> 0 -> 8

# Количество узлов в каждом связаном списке от 1 до 100
# Значение узла 0 <= Node.val <= 9
# Гарантируется, что список представляет числа без незначащих нулей

# Definition for singly-linked list.

# Добавлены вспомогательные методы для перевода числа в массив цифр
class Integer
    def size_of_number
        size = 0
        number = self
        while number > 0
            size += 1
            number = number/10           
        end
        size
    end

    def to_array
        arr = []
        converter = lambda do |number|
            power = number.size_of_number - 1
            if power < 0
                arr
            else 
                arr.push(number/(10**power))
                converter.call(number%(10**power))  
            end
        end
        converter.call(self)
    end     
end

class ListNode
    attr_accessor :val, :_next
    def initialize(val = 0, _next = nil)
        raise "The value must be val >= 0 or val <= 9" unless ListNode.valid?(val)
        @val = val
        @_next = _next
    end

    def ListNode.valid?(val)        
        val.is_a?(Integer) && (val >= 0 && val <= 9)
    end    
 end

class LinkedList
    attr_accessor :head, :tail
    attr_reader :length

    def initialize(number)
        raise 'The value must be a number' unless number.is_a? Integer
        @tail = ListNode.new()
        @length = 0
        arr = number.to_array

        arr = [8, 5, 3, 0]
        arr.each do |value|
            newNode = ListNode.new(value)
            # @head = newNode  if @head.nil?
             unless @tail.nil?
                @tail._next = newNode
                puts @tail.inspect
             end
            @tail = newNode
            # puts newNode.inspect
            @length += 1
        end
    end

    def each 
        x = 0
        while x <= length
            x += 1
        end
        puts x.inspect
    end    
    
    def append(value)
        raise 'The list is too long, the length is more then 100'  if @length == 100
        newNode = ListNode.new(value)      
        @tail.next = newNode 
        @tail = newNode
        @length += 1 
    end
    
    def reverse
        
    end

end    

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    
end

newList = LinkedList.new(8530)




puts newList.inspect



