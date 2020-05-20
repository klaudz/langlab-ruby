#!/usr/bin/ruby

require_relative '../_utils/printer'

$p = Langlab::Printer.new
$p.new_line

def _catalog_
    create_arrays
    get_set_items
    obtain_information
    iterate_arrays
    select_items
    add_remove_items
end

def create_arrays

    puts "----- Create Arrays ---------------", ""

    $p << [ false, 1, "2", 3.0 ]        #=> [false, 1, "2", 3.0]
    $p << [ "a", "b", "c", "d" ]        #=> ["a", "b", "c", "d"]
    $p.new_line

    $p << Array.new                     #=> []
    $p << Array.new(4)                  #=> [nil, nil, nil, nil]
    $p << Array.new(4, "str")           #=> ["str", "str", "str", "str"]
    $p.new_line

    $p << Array.new(4) { "str" }        #=> ["str", "str", "str", "str"]
    $p << Array.new(4) { |i| i.to_s }   #=> ["0", "1", "2", "3"]
    $p.new_line

end

def get_set_items

    puts "----- Get Items ---------------", ""

    array = [ 0, 1, 2, 3, 4, 5, 6 ]
    
    $p << array[1]              #=> 1
    $p << array[9]              #=> nil
    $p << array[-1]             #=> 6
    $p << array[-9]             #=> nil
    $p.new_line

    # [start, length]
    $p << array[2, 4]           #=> [2, 3, 4, 5]
    $p.new_line

    # [start..end]
    $p << array[2..4]           #=> [2, 3, 4]
    $p << array[2..-1]          #=> [2, 3, 4, 5, 6]
    $p << array[2..-6]          #=> []
    $p << array[-4..-2]         #=> [3, 4, 5]
    $p.new_line

    puts "----- Set Items ---------------", ""

    array = [ 0, 1, 2, 3, 4 ]
    array[1] = "1"
    array[7] = "7"
    $p << array                 #=> [0, "1", 2, 3, 4, nil, nil, "7"]
    $p.new_line

end

def obtain_information

    puts "----- Obtain Information ---------------", ""

    array = [ 0, 1, 2, 3, 4, 5, 6 ]

    $p << array.length              #=> 7
    $p << array.count               #=> 7
    $p << array.size                #=> 7
    $p.new_line

    $p << array.empty?              #=> false
    $p.new_line

    $p << array.include?(3)         #=> true
    $p << array.include?(7)         #=> false
    $p.new_line
    
end

def iterate_arrays

    puts "----- Iterate Arrays ---------------", ""

    # `each` and `reverse_each`
    array = [ 0, 1, 2, 3 ]
    array_e = []
    array_r = []
    array.each         { |i| array_e << i ** 2 }
    array.reverse_each { |i| array_r << i ** 2 }
    $p << array                             #=> [0, 1, 2, 3]
    $p << array_e                           #=> [0, 1, 4, 9]
    $p << array_r                           #=> [9, 4, 1, 0]
    $p.new_line

    # <<< `map` and `map!`

    array = [ "a", "b", "c", "d" ]
    $p << array.map { |item| "_" + item }   #=> ["_a", "_b", "_c", "_d"]
    $p << array                             #=> ["a", "b", "c", "d"]
    $p.new_line

    array = [ "a", "b", "c", "d" ]
    $p << array.map! { |item| "_" + item }  #=> ["_a", "_b", "_c", "_d"]
    $p << array                             #=> ["_a", "_b", "_c", "_d"]
    $p.new_line

    # >>>

end

def select_items

    puts "----- Select Items ---------------", ""

    # <<< `select` and `select!`

    array = [ 0, 1, 2, 3, 4 ]
    $p << array.select { |i| i % 2 == 0 }   #=> [0, 2, 4]
    $p << array                             #=> [0, 1, 2, 3, 4]
    $p.new_line

    array = [ 0, 1, 2, 3, 4 ]
    $p << array.select! { |i| i % 2 == 0 }  #=> [0, 2, 4]
    $p << array                             #=> [0, 2, 4]
    $p.new_line

    # >>>

end

def add_remove_items

    puts "----- Add and Remove Items ---------------", ""

    # `push` and `pop`
    array = [ "0", "1", "2", "3" ]
    $p << array.push("4")                       #=> ["0", "1", "2", "3", "4"]
    $p << array.push("5", "6")                  #=> ["0", "1", "2", "3", "4", "5", "6"]
    $p << ( array << "7" )                      #=> ["0", "1", "2", "3", "4", "5", "6", "7"]
    $p << array.pop                             #=> "7"  (removed)
    $p << array.pop(1)                          #=> ["6"]  (removed)
    $p << array.pop(2)                          #=> ["4", "5"] (removed)
    $p << array                                 #=> ["0", "1", "2", "3"]
    $p.new_line

    # `unshift` and `shift`
    array = [ "0", "1", "2", "3" ]
    $p << array.unshift("-1")                   #=> ["-1", "0", "1", "2", "3"]
    $p << array.shift                           #=> "-1"  (removed)
    $p << array                                 #=> ["0", "1", "2", "3"]
    $p.new_line

    # `insert`, `delete_at` and `delete`
    array = [ "0", "1", "1", "2" ]
    $p << array.insert(3, "1.1")                #=> ["0", "1", "1", "1.1", "2"]
    $p << array.insert(1, "0.1", "0.2", "0.3")  #=> ["0", "0.1", "0.2", "0.3", "1", "1", "1.1", "2"]
    $p << array.delete_at(1)                    #=> "0.1"  (removed)
    $p << array                                 #=> ["0", "0.2", "0.3", "1", "1", "1.1", "2"]
    $p << array.delete("-1")                    #=> nil  (not found)
    $p << array.delete("1")                     #=> "1"  (removed)
    $p << array                                 #=> ["0", "0.2", "0.3", "1.1", "2"]
    $p.new_line

end

_catalog_
