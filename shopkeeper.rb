require_relative 'products'

class Shopkeeper
 	def shop_choice

		puts "press 1. Add a product"
		puts "press 2. Remove a product"
		puts "press 3. List a product"
		puts "press 4. Search a product"
		puts "press 5. Edit a product"
		choice = gets.to_i
		
		case choice
		
		  when 1
				add = Products.new
				add.genrate_id	
				a = Shopkeeper.new
				a.shop_choice
		  when 2
		  	remove = Products.new
		  	remove.remove_product

		  when 3	
		  	list = Products.new
		  	list.list_product
		  when 4	
		  	search = Products.new
		  	search.search_product
		  when 5	
		  	edit = Products.new
		  	edit.edit_product
		  else
		  	puts "choose correct option"
		end

 	end

end

