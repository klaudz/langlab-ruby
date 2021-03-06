#!/usr/bin/ruby

require_relative '../_utils/printer'

$p = Langlab::Printer.new
$p.new_line

def _catalog_
    match_files
end

def match_files

    puts "----- Match Files ---------------", ""

    $p << Dir["_sample_files/*.txt"]                #=> ["_sample_files/text_file.txt"]
    $p << Dir["_sample_files/**/*.txt"]             #=> ["_sample_files/directory/text_file.txt", "_sample_files/text_file.txt"]
    $p << Dir["_sample_files/**/*.??"]              #=> ["_sample_files/ruby_file.rb"]
    $p << Dir["_sample_files/not_exists"]           #=> []
    $p.new_line

end

_catalog_
