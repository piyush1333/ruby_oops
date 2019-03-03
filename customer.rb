require_relative 'products'

class Customer
  def customer
    puts "Press 1 for list of the product"
    puts "Press 2 for search product"
    puts "Press 3 for buy any product"
    choice =  gets.to_i

    case choice
      when 1
        list = Products.new
        list.list_product
      when 2
        search = Products.new
        search.search_product
      when 3
        buy = Products.new
        buy.buy_product
      else
        puts "choose correct option"
    end

    
  end
end


