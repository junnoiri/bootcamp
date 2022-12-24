class WashingMachine
  MAXIMUM_WASHING_MACHINE_CAPACITY = 30

  def initialize
    @laundry_items = []
  end

  def put_clothes(clothes)
    @clothes = clothes
    if @laundry_items.length >= MAXIMUM_WASHING_MACHINE_CAPACITY
      puts "The washing machine is full."
    else
      @laundry_items.push(@clothes)
    end
  end

  def take_clothes(clothes)
    @clothes = clothes
    @laundry_items.delete(@clothes)
  end 

  def wash_clothes
    @laundry_items.each { |laundry_item| 
      if laundry_item.condition == "dirty"
        laundry_item.condition = "clean"
      elsif laundry_item.condition == "clean"
        puts "The #{laundry_item.name} is already clean"
      else
        puts "The condition has something wrong"  
      end
    }
  end 
end

class Clothes
  attr_accessor :name, :condition

  def initialize(name, condition)
    @name = name
    @condition = condition
  end
end

t_shirt = Clothes.new("t-shirt", "dirty")
jeans = Clothes.new("jeans", "clean")

p t_shirt.condition
p jeans.condition

washing_machine = WashingMachine.new()

washing_machine.put_clothes(t_shirt)
washing_machine.put_clothes(jeans)

washing_machine.wash_clothes

washing_machine.take_clothes(t_shirt)
washing_machine.take_clothes(jeans)

p t_shirt.condition
p jeans.condition