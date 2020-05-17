#!/usr/bin/ruby

require_relative '../_utils/printer'

$p = Langlab::Printer.new
$p.new_line

def determine_access

    puts "----- Determine Access ---------------", ""

    text_file_path = "_sample_files/text_file.txt"
    directory_path = "_sample_files/directory"
    file_path_not_exists = "_sample_files/not_exists"

    $p << File.exist?(text_file_path)               #=> true
    $p << File.exist?(directory_path)               #=> true
    $p << File.exist?(file_path_not_exists)         #=> false
    $p.new_line

    $p << File.file?(text_file_path)                #=> true
    $p << File.file?(directory_path)                #=> false
    $p << File.file?(file_path_not_exists)          #=> false
    $p.new_line

    $p << File.directory?(text_file_path)           #=> false
    $p << File.directory?(directory_path)           #=> true
    $p << File.directory?(file_path_not_exists)     #=> false
    $p.new_line

end

determine_access
