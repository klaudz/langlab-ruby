
module Langlab
    
    class Printer
        def <<(object)
            puts object.nil? ? "nil" : object.is_a?(String) ? "\"#{object}\"" : "#{object}"
            return object
        end
        def new_line
            puts ""
        end
    end
    
end