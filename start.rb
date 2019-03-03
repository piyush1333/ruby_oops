require_relative 'customer'
require_relative 'shopkeeper'


class Option
  def choose

    puts "Press 1 for Customer and Press 2 for ShopKeepers"
    choice = gets.to_i
    case choice
    	when 1
     	 obj1 = Customer.new
     	 obj1.customer
    	when 2
				obj1= Shopkeeper.new
    	  obj1.shop_choice
  		else
  			puts "choose correct option"
  	end	

  end
end

run = Option.new
run.choose