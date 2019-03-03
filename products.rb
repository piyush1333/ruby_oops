require 'json'
require_relative 'file_operation'
class Products < FileOperation


  def initialize() 
    @product_data = {}
  end

  def add_product(id)

    puts "Enter product Name"
    product_name = gets.strip.to_s
    puts "Enter product Price"
    price= gets.strip.to_s
    puts "Enter product Stock Item"
    stock_item = gets.strip.to_s
    puts "Enter product Company Name"
    com_name = gets.strip.to_s
    product_data = {id: id,name: product_name,price: price,stock_item: stock_item,company_name: com_name}
    file = Products.new
    file.file_add(product_data)
  end
  
  def remove_product
    puts "Enter the id of the product to remove a product"
    id = gets.to_i
    remove = Products.new
    remove.file_remove(id)
  end
  
  def list_product
    list = Products.new
    list.file_list
  end

  def search_product
    puts "Enter the name to search a product"
    name = gets.strip
    search = Products.new
    search.file_search(name)
  end
  
  def edit_product
    puts "Enter a id of the produt to edit a product"
    number = gets.strip.to_i
    puts "Enter the new name of the product"
    new_name = gets.strip.to_s
    puts "Enter the price of the product"
    new_price = gets.strip.to_s
    edit = Products.new
    edit.file_edit(number,new_name,new_price)

  end

  def buy_product 
    puts "Enter the id of the product to buy"
    product_id = gets.to_i
    puts "Enter your name"
    c_name = gets.strip.to_s
    puts "Enter your card numebr"
    c_number = gets.strip.to_i
    puts "Enter your CVV"
    c_cvv = gets.strip.to_i
    customer ={id: product_id,name: c_name,card_no:c_number,cvv:c_cvv }
    buy = Products.new
    buy.product_buy(product_id,customer)
 
  end

  def genrate_id
    arr = []
    i=0
    string = File.read(FILENAME)
    string.split("\n").each do |item|
      arr[i] = item.split("|")
      i = i + 1
    end
    length = arr.length
    id = length + 1
    add_product(id)
  end

 

end