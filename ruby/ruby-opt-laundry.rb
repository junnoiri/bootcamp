class WashingMachine
  CAPACITY = 30

  def initialize
    @laundry_items = []
  end

  def put_clothes(clothes)
    if @laundry_items.length >= CAPACITY
      puts "The washing machine is full."
    else
      @laundry_items.push(clothes)
    end
  end

  def take_clothes(clothes)
    @laundry_items.delete(clothes)
  end 

  def wash_clothes
    @laundry_items.each { |laundry_item| 
      laundry_item.condition[0] = "clean"
      laundry_item.condition.push("wet")
    }
  end

  def dry_clothes
    @laundry_items.each { |laundry_item| 
      laundry_item.condition[1] = "dry"
    }
  end
end

class Clothes
  attr_accessor :name, :condition

  def initialize(name, condition)
    @name = name
    @condition = [condition]
  end
end

t_shirt = Clothes.new("t-shirt", "dirty")
jeans = Clothes.new("jeans", "clean")

puts t_shirt.condition
puts jeans.condition

washing_machine = WashingMachine.new()

washing_machine.put_clothes(t_shirt)
washing_machine.put_clothes(jeans)

washing_machine.wash_clothes

washing_machine.take_clothes(t_shirt)
washing_machine.take_clothes(jeans)

puts t_shirt.condition
puts jeans.condition

# 服を乾燥させるためにもう一度衣類を入れる
washing_machine.put_clothes(t_shirt)
washing_machine.put_clothes(jeans)

washing_machine.dry_clothes

washing_machine.take_clothes(t_shirt)
washing_machine.take_clothes(jeans)

puts t_shirt.condition
puts jeans.condition