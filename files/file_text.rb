#!/usr/bin/ruby

require_relative '../_utils/printer'

$p = Langlab::Printer.new
$p.new_line

def _catalog_
    read_lines
    write_lines
end

def read_lines

    puts "----- Read Lines ---------------", ""

    # <<< `File.each_line`

    File.open("_sample_files/text_file.txt", "r") { |file|
        lines = []
        file.each_line { |line|
            lines.push(line)
        }
        $p << lines             #=> ["I am a text file.\n", "This is the second line.\n", "And the third line."]
    }

    # >>>

    $p.new_line

end

def write_lines

    puts "----- Write Lines ---------------", ""

    def _read_output_delete_text_file(file_path)
        File.open(file_path, "r") { |file|
            lines_for_read = []
            file.each_line { |line| lines_for_read.push(line) }
            $p << lines_for_read    #=> ["The first line,\n", "the second line,\n", "and the third line.\n"]
            File.delete(file)
        }
    end

    lines_for_write = [ "The first line,", "the second line,", "and the third line." ]
    file_path_for_write = "_sample_files/text_file_for_write.txt"

    # <<< `File.puts`

    File.open(file_path_for_write, "w") { |file|
        lines_for_write.each { |line| 
            file.puts(line)
        }
    }
    _read_output_delete_text_file(file_path_for_write)

    # >>>

    # <<< `File.write`

    File.open(file_path_for_write, "w") { |file|
        lines_for_write.each { |line| 
            file.write(line + "\n")
        }
    }
    _read_output_delete_text_file(file_path_for_write)

    # >>>

    $p.new_line

end

_catalog_
