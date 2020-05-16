
module Langlab
    
    class Printer
        def <<(object)
            puts object.nil? ? "nil" : "#{object}"
            return object
        end
    end
    
end