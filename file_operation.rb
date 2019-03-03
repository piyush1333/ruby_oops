require_relative 'products'
FILENAME = "database.txt"
REPLACE = "remove.txt"
CUSTOMER = "customer_data.txt"
class FileOperation

  def initialize() 
    # @list = {}
  end

  def file_add(product_data) 
    add = File.open(FILENAME, 'a')
    add.write(product_data.values.join('|')+"\n")
    add.close
  end

  def file_list
    read = File.open(FILENAME, 'r')
    read.each do |list|
      puts "#{list}\n"
    end
  end

  def file_search(name)
    search = File.read(FILENAME)
    search.split("\n").each do |x|
      var = x.split("|") 
      if var[1].eql?(name) 
        p  var[1],var[2]
        break
      end
    end
  end

  def file_remove(id)
    string = File.read(FILENAME)
    string.split("\n").each do |item|
      var = item.split("|")
      if var[0].to_i != id 
        re_write = File.open(REPLACE, 'a+')
        re_write.write(var.join('|')+"\n")
      end
    end
    File.delete(FILENAME)
    File.rename(REPLACE, FILENAME)
    
  end


  def file_edit(number,new_name,new_price)
    string = File.read(FILENAME)
    string.split("\n").each do |item|
    var = item.split("|")
    if var[0].to_i == number 
      var[1] = new_name
      var[2] = new_price
      re_write = File.open(REPLACE, 'a+')
      re_write.write(var.join('|')+"\n")
    else
      re_write = File.open(REPLACE, 'a+')
      re_write.write(var.join('|')+"\n")
    end
    end
    File.delete(FILENAME)
    File.rename(REPLACE, FILENAME)
  end

  def product_buy(product_id,customer)
    check = File.read(FILENAME)
    check.split("\n").each do |x|
      var = x.split("|") 
      if var[0].to_i.eql?(product_id)
        if var[3].to_i != 0
          p var[3]
          customer_info(customer) 
          stock_minus(product_id)
        else
          puts " product out of stock"
        end
        
      end 
    end
  end

  def customer_info(customer)
    add = File.open(CUSTOMER, 'a+')
    add.write(customer.values.join('|')+"\n")
    add.close
  end

  def stock_minus(product_id)
    string = File.read(FILENAME)
    string.split("\n").each do |item|
    var = item.split("|")
    
    if var[0].to_i == product_id 
      minus = var[3].to_i
      minus = minus - 1
      var[3] = minus
      re_write = File.open(REPLACE, 'a+')
      re_write.write(var.join('|')+"\n")
    else
      re_write = File.open(REPLACE, 'a+')
      re_write.write(var.join('|')+"\n")
    end
    end
    File.delete(FILENAME)
    File.rename(REPLACE, FILENAME)
  end
end