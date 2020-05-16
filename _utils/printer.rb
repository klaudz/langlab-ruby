
module Langlab
    
    class Printer
        def <<(object)
            puts object ? "#{object}" : "nil"
            return object
        end
    end
    
end