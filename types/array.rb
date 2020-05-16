#!/usr/bin/ruby

require_relative '_utils/printer'

$p = Langlab::Printer.new

def create_arrays

    puts "----- Create Array ---------------"

    $p << [ false, 1, "2", 3.0 ]         # => [false, 1, "2", 3.0]
    $p << [ "a", "b", "c", "d" ]         # => ["a", "b", "c", "d"]

    $p << Array.new                      # => []
    $p << Array.new(4)                   # => [nil, nil, nil, nil]
    $p << Array.new(4, "str")            # => ["str", "str", "str", "str"]

    $p << Array.new(4) { "str" }         # => ["str", "str", "str", "str"]
    $p << Array.new(4) { |i| i.to_s }    # => ["0", "1", "2", "3"]

end

def access_elements

    puts "----- Access Elements ---------------"

    array = [ 0, 1, 2, 3, 4, 5, 6 ]
    
    $p << array[1]       # => 1
    $p << array[9]       # => nil
    $p << array[-1]      # => 6
    $p << array[-9]      # => nil

    # [start, length]
    $p << array[2, 4]    # => [2, 3, 4, 5]

    # [start..end]
    $p << array[2..4]    # => [2, 3, 4]
    $p << array[2..-1]   # => [2, 3, 4, 5, 6]
    $p << array[2..-6]   # => []
    $p << array[-4..-2]  # => [3, 4, 5]

end

def obtain_information

    puts "----- Obtain Information ---------------"

    array = [ 0, 1, 2, 3, 4, 5, 6 ]

    $p << array.length       # => 7
    $p << array.count        # => 7
    $p << array.size         # => 7

    $p << array.empty?       # => false

    $p << array.include?(3)  # => true
    $p << array.include?(7)  # => false
    
end

def iterate_arrays

    puts "----- Iterate Arrays ---------------"

    # `each` and `reverse_each`
    array_0 = [ 0, 1, 2, 3 ]
    array_1 = []
    array_2 = []
    array_0.each         { |i| array_1 << i ** 2 }
    array_0.reverse_each { |i| array_2 << i ** 2 }
    $p << array_0    # => [0, 1, 2, 3]
    $p << array_1    # => [0, 1, 4, 9]
    $p << array_2    # => [9, 4, 1, 0]

    # <<< `map` and `map!`

    old_array = [ "a", "b", "c", "d" ]
    new_array = old_array.map { |item| "_" + item }
    $p << old_array  # => ["a", "b", "c", "d"]
    $p << new_array  # => ["_a", "_b", "_c", "_d"]

    old_array = [ "a", "b", "c", "d" ]
    new_array = old_array.map! { |item| "_" + item }
    $p << old_array  # => ["_a", "_b", "_c", "_d"]
    $p << new_array  # => ["_a", "_b", "_c", "_d"]

    # >>>

end

create_arrays
access_elements
obtain_information
iterate_arrays
