class WashingMachine
  @@laundry_items = []

  def put_clothes(clothes)
    @clothes = clothes
    
    if @@laundry_items.length > 30
      puts "The washing machine is full."
    else
      @@laundry_items.push(@clothes.name)
    end
  end

  def take_clothes(clothes)
    @clothes = clothes

    if @clothes.condition == "dirty"
      @clothes.condition = "clean"
    elsif @clothes.condition == "clean"
      puts "The #{@clothes.name} is already clean" 
    else
      puts "The condition has something wrong"  
    end
    
    @@laundry_items.delete(@clothes.name)
    return @clothes
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

t_shirt_laundry = washing_machine.take_clothes(t_shirt)
jeans_laundry = washing_machine.take_clothes(jeans)

p t_shirt_laundry.condition
p jeans_laundry.condition