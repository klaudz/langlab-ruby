#!/usr/bin/ruby

require_relative '_utils/printer'

$p = Langlab::Printer.new
$p.new_line

def create_hashes

    puts "----- Create Hashes ---------------", ""

    $p << { "k0" => "v0", "k1" => 1, 0 => 0 }   #=> {"k0"=>"v0", "k1"=>1, 0=>0}
    $p << { :k0 => "v0", :k1 => 1 }             #=> {:k0=>"v0", :k1=>1}
    $p << { k0: "v0", k1: 1 }                   #=> {:k0=>"v0", :k1=>1}
    $p << { "k0": "v0", "k1": 1, "0": 0 }       #=> {:k0=>"v0", :k1=>1, :"0"=>0}
  # $p << { :k0 => "v0", :k1 => 1, :0 => 0 }    # syntax error
  # $p << { k0: "v0", k1: 1, 0: 0 }             # syntax error
    $p.new_line

    $p << Hash.new                              #=> {}
    $p.new_line

    # <<< Default value

    default_value = "default"

    hash = Hash.new(default_value)
    $p << hash                                  #=> {}
    $p << hash["key"]                           #=> "default"
    $p.new_line

    hash = {}
    $p << hash                                  #=> {}
    $p << hash["key"]                           #=> nil
    hash.default = default_value
    $p << hash["key"]                           #=> "default"
    $p.new_line

    # >>>

end

def get_set_keys_values

    puts "----- Get Keys and Values ---------------", ""

    hash = { "k0" => "v0", "k1" => "v1", :k2 => "v2" }
    
    $p << hash["k0"]            #=> "v0"
    $p << hash["k1"]            #=> "v1"
    $p << hash["k2"]            #=> nil
    $p << hash[:k2]             #=> "v2"
    $p.new_line

    puts "----- Set Keys and Values ---------------", ""

    hash = { "k0" => "v0", :k0 => "v0" }
    hash["k0"] = "_v0"          # Update value
    hash[:k0] = "_v0"           # Update value
    hash["k1"] = "_v1"          # Add key and value
    hash[2] = 2
    hash[nil] = nil
    $p << hash                  #=> {"k0"=>"_v0", :k0=>"_v0", "k1"=>"_v1", 2=>2, nil=>nil}
    $p.new_line

end

def obtain_information

    puts "----- Obtain Information ---------------", ""

    hash = { "k0" => "v0", "k1" => "v1" }

    $p << hash.length           #=> 2
    $p << hash.count            #=> 2
    $p << hash.size             #=> 2
    $p.new_line

    $p << hash.empty?           #=> false
    $p.new_line
    
end

def iterate_hashes

    puts "----- Iterate Hashes ---------------", ""

    # `each`
    hash = { "k0" => "v0", "k1" => "v1" }
    hash_e = {}
    $p << hash.each { |key, value|
        key_e = "_" + key
        value_e = "_" + value
        hash_e[key_e] = value_e
    }                               #=> {"k0"=>"v0", "k1"=>"v1"}
    $p << hash_e                    #=> {"_k0"=>"_v0", "_k1"=>"_v1"}
    $p.new_line

    # >>>

end

create_hashes
get_set_keys_values
obtain_information
iterate_hashes
