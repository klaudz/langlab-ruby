#!/usr/bin/ruby

require 'json'
require_relative '../_utils/printer'

$p = Langlab::Printer.new
$p.new_line

def generate_json

    puts "----- Generate JSON ---------------", ""

    object = {
        "bool" => true,
        "number" => 18,
        "string" => "string",
        "array" => [ 0, 1 ],
        "hash" => { "k0" => "v0", "k1" => "v1" },
    }
    $p << object.to_json            #=> '{"bool":true,"number":18,"string":"string","array":[0,1],"hash":{"k0":"v0","k1":"v1"}}'
    $p << JSON.generate(object)     #=> '{"bool":true,"number":18,"string":"string","array":[0,1],"hash":{"k0":"v0","k1":"v1"}}'
    $p << JSON.generate(object, {   #=> '{
        :indent => "  ",            #     "bool": true,
        :space => " ",              #     "number": 18,
        :object_nl => "\n",         #     "string": "string",
        :array_nl => "\n"           #     "array": [
    })                              #       0,
                                    #       1
                                    #     ],
                                    #     "hash": {
                                    #       "k0": "v0",
                                    #       "k1": "v1"
                                    #     }
                                    #   }'
    $p.new_line

end

def parse_json

    puts "----- Parse JSON ---------------", ""

    json_string = '{"bool":true,"number":18,"string":"string","array":[0,1],"hash":{"k0":"v0","k1":"v1"}}'
    $p << JSON.parse(json_string)   #=> {"bool"=>true, "number"=>18, "string"=>"string", "array"=>[0, 1], "hash"=>{"k0"=>"v0", "k1"=>"v1"}}
    $p.new_line

end

generate_json
parse_json
