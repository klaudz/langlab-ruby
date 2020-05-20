#!/usr/bin/ruby

require_relative '../_utils/printer'

$p = Langlab::Printer.new
$p.new_line

def _catalog_
    work_with_absolute_paths
end

def work_with_absolute_paths

    puts "----- Work with Absolute Paths ---------------", ""

    # <<< `absolute_path`

    # Remark: Assumes the working directory is "/Users/klaudz"
    $p << File.absolute_path("")                        #=> "/Users/klaudz"
    $p << File.absolute_path(".")                       #=> "/Users/klaudz"
    $p << File.absolute_path("file_name")               #=> "/Users/klaudz/file_name"
    $p << File.absolute_path("/Users/klaudz/file_name") #=> "/Users/klaudz/file_name"
    $p.new_line

    # Remark: Assumes the working directory is "/Users/klaudz"
    $p << File.absolute_path("file_name", "/Users/cat") #=> "/Users/cat/file_name"
    $p << File.absolute_path("file_name", "")           #=> "/Users/klaudz/file_name"
    $p << File.absolute_path("file_name", ".")          #=> "/Users/klaudz/file_name"
    $p << File.absolute_path("file_name", "dir_name")   #=> "/Users/klaudz/dir_name/file_name"
    $p << File.absolute_path("/Users/klaudz/file_name", "/Users/cat")
                                                        #=> "/Users/klaudz/file_name"
    $p.new_line

    # >>>

end

_catalog_
