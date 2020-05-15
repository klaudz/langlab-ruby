#!/usr/bin/ruby

def create_arrays

    puts "----- Create Array ---------------"
    r = []

    r << [ false, 1, "2", 3.0 ]         # => [false, 1, "2", 3.0]
    r << [ "a", "b", "c", "d" ]         # => ["a", "b", "c", "d"]

    r << Array.new                      # => []
    r << Array.new(4)                   # => [nil, nil, nil, nil]
    r << Array.new(4, "str")            # => ["str", "str", "str", "str"]

    r << Array.new(4) { "str" }         # => ["str", "str", "str", "str"]
    r << Array.new(4) { |i| i.to_s }    # => ["0", "1", "2", "3"]

    r.each { |e| puts "#{e}" }

end

def access_elements

    puts "----- Access Elements ---------------"
    array = [ 0, 1, 2, 3, 4, 5, 6 ]
    r = []
    
    r << array[1]       # => 1
    r << array[9]       # => nil
    r << array[-1]      # => 6
    r << array[-9]      # => nil

    # [start, length]
    r << array[2, 4]    # => [2, 3, 4, 5]

    # [start..end]
    r << array[2..4]    # => [2, 3, 4]
    r << array[2..-1]   # => [2, 3, 4, 5, 6]
    r << array[2..-6]   # => []
    r << array[-4..-2]  # => [3, 4, 5]

    r.each { |e| puts e ? "#{e}" : "nil" }

end

def obtain_information

    puts "----- Obtain Information ---------------"
    array = [ 0, 1, 2, 3, 4, 5, 6 ]
    r = []

    r << array.length       # => 7
    r << array.count        # => 7
    r << array.size         # => 7

    r << array.empty?       # => false

    r << array.include?(3)  # => true
    r << array.include?(7)  # => false

    r.each { |e| puts "#{e}" }
    
end

create_arrays
access_elements
obtain_information