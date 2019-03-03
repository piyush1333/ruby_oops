puts "************************************** Variable Scope **********************************"


$global_var = "global"
class Greeter
  attr_accessor :surname
  def initialize(name = "World")
    @name = name
    @surname = "joshi"
    @@company = "WGBL"
    local_name = "local"
  end
  
  def access
    puts "Access global variable #{$global_var}"
    puts "Access class variable #{@@company}"
    puts "Access instance variable #{@name}"
    puts "Access instance variable #{local_name}"
  end

end

obj = Greeter.new
obj.access


puts "******************************** Getter and Setter *************************************"


class Person
  def initialize(name)
    @name = name
  end

  def name                   
    @name
  end
end

mike = Person.new('Mike')
mike.name                    


