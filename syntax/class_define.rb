#!/usr/bin/ruby

puts ""

def _catalog_
    test_class
    test_parent_instance
    test_child_instance
end

class Parent

    ### Initialize
    # `initialize` (override)
    def initialize(v0, v1)
        puts \
            "[" + self.class.to_s + "] `initialize` called, "\
            "@instance_variable_0 = " + @instance_variable_0.to_s + ", "\
            "@instance_variable_1 = " + @instance_variable_1.to_s
        @instance_variable_0 = v0
        @instance_variable_1 = v1
        puts \
            "[" + self.class.to_s + "] `initialize` finished, "\
            "@instance_variable_0 = " + @instance_variable_0.to_s + ", "\
            "@instance_variable_1 = " + @instance_variable_1.to_s
    end

    ### Instance methods
    def instance_method_0
        puts "[" + self.class.to_s + "] `instance_method_0` called"
    end
    def instance_method_1(v0, v1)
        puts "[" + self.class.to_s + "] `instance_method_1` called"
    end

    ### Instance variables
    # Define
    # Note: Instance variables will NOT be effected by `=` here (different from class variables)
    @instance_variable_0 = "init_0"
    @instance_variable_1 = "init_1"
    # Getter
    def instance_variable_0
        puts "[" + self.class.to_s + "] get @instance_variable_0 = " + @instance_variable_0.to_s
        @instance_variable_0
    end
    # Setter
    def instance_variable_0=(value)
        @instance_variable_0 = value
        puts "[" + self.class.to_s + "] set @instance_variable_0 = " + @instance_variable_0.to_s
    end

    ### Class methods
    def self.class_method_0
        puts "[" + self.to_s + "] `class_method_0` called"
    end
    def self.class_method_1(v0, v1)
        puts "[" + self.to_s + "] `class_method_1` called"
    end

    ### Class variables
    # Define and implement
    # Note: Class variables will be effected by `=` here (different from instance variables)
    @@class_variable_0 = "init_0"
    @@class_variable_1 = "init_1"
    def self.class_variable_0
        puts "[" + self.to_s + "] get @@class_variable_0 = " + @@class_variable_0.to_s
        @@class_variable_0
    end
    def self.class_variable_0=(value)
        @@class_variable_0 = value
        puts "[" + self.to_s + "] set @@class_variable_0 = " + @@class_variable_0.to_s
    end
end

class Child < Parent

end

def test_class

    puts "----- Test Class Methods and Varibles ---------------", ""

    Child.class_method_0                            #=> [Child] `class_method_0` called
    Child.class_method_1("v0", "v1")                #=> [Child] `class_method_1` called
    tmp = Child.class_variable_0                    #=> [Child] get @@class_variable_0 = init_0
    Child.class_variable_0 = "set_0"                #=> [Child] set @@class_variable_0 = set_0
    tmp = Child.class_variable_0                    #=> [Child] get @@class_variable_0 = set_0
    puts ""

end

def test_parent_instance

    puts "----- Test Parent Instance Methods and Varibles ---------------", ""

    parent = Parent.new("init_set_0", "init_set_1") #=> [Parent] `initialize` called,
                                                    #               @instance_variable_0 = , @instance_variable_1 = 
                                                    #=> [Parent] `initialize` finished,
                                                    #               @instance_variable_0 = init_set_0, @instance_variable_1 = init_set_1
    parent.instance_method_0                        #=> [Parent] `instance_method_0` called
    parent.instance_method_1("v0", "v1")            #=> [Parent] `instance_method_1` called
    tmp = parent.instance_variable_0                #=> [Parent] get @instance_variable_0 = init_set_0
    parent.instance_variable_0 = "set_0"            #=> [Parent] set @instance_variable_0 = set_0
    tmp = parent.instance_variable_0                #=> [Parent] get @instance_variable_0 = set_0
    puts ""

end

def test_child_instance

    puts "----- Test Child Instance Methods and Varibles ---------------", ""

    child = Child.new("init_set_0", "init_set_1")   #=> [Child] `initialize` called,
                                                    #               @instance_variable_0 = , @instance_variable_1 = 
                                                    #=> [Child] `initialize` finished,
                                                    #               @instance_variable_0 = init_set_0, @instance_variable_1 = init_set_1
    child.instance_method_0                         #=> [Child] `instance_method_0` called
    child.instance_method_1("v0", "v1")             #=> [Child] `instance_method_1` called
    tmp = child.instance_variable_0                 #=> [Child] get @instance_variable_0 = init_set_0
    child.instance_variable_0 = "set_0"             #=> [Child] set @instance_variable_0 = set_0
    tmp = child.instance_variable_0                 #=> [Child] get @instance_variable_0 = set_0
    puts ""

end

_catalog_
