#!/usr/bin/ruby

def create_array

    array_a0 = [ false, 1, "2", 3.0 ]       # => [false, 1, "2", 3.0]
    array_a1 = [ "a", "b", "c", "d" ]       # => ["a", "b", "c", "d"]

    puts "#{array_a0}"
    puts "#{array_a1}"

    array_b0 = Array.new                    # => []
    array_b1 = Array.new(4)                 # => [nil, nil, nil, nil]
    array_b2 = Array.new(4, "str")          # => ["str", "str", "str", "str"]
    
    puts "#{array_b0}"
    puts "#{array_b1}"
    puts "#{array_b2}"

    array_c0 = Array.new(4) { "str" }       # => ["str", "str", "str", "str"]
    array_c1 = Array.new(4) { |i| i.to_s }  # => ["0", "1", "2", "3"]

    puts "#{array_c0}"
    puts "#{array_c1}"

end

create_array