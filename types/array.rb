#!/usr/bin/ruby

def create_array

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

create_array
