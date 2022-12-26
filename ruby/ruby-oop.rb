# オブジェクト指向

# オブジェクト指向で重要な概念
# クラス
# オブジェクト指向でのクラスとは、オブジェクトの設計図のこと。全てのオブジェクト指向は何らかのクラスに属している。
# オブジェクト指向は役割と命令がなければ、自分で動けない。

# インスタンス
# インスタンスとは、クラスを具象化したもの

# メソッド
# オブジェクト指向でのメソッドとは、クラスに命令する動作のこと。車でいうと、アクセルやブレーキ

class Car
  # インスタンス変数
  attr_accessor :price, :color, :speed

  # イニシャライザ
  def initialize(price, color, speed)
    @price = price
    @color = color
    @speed = speed
  end

  # メソッド
  def accelerate
    @speed += 10
  end

  def brake
    @speed -= 10
  end

end

# クラスをオブジェクト化
car1 = Car.new(200000, "Black", 200)
car2 = Car.new(2000000, "Red", 300)
car3 = Car.new(10000000, "Green", 100)
car4 = Car.new(20000000, "Black", 200)
car5 = Car.new(50000000, "Blue", 350)

puts car1.price
puts car1.accelerate
puts car2.color
puts car3.accelerate
puts car4.speed
puts car5.accelerate

# 実行結果
# 200000
# 210
# Red
# 110
# 200
# 360


class Apple
  def initialize(quantity, price)
    @quantity = quantity
    @price = price
  end
   
  def show_quantity_price
    puts "りんごを#{@quantity}個買い、#{calculate_total_price(@quantity, @price)}円でした。"
  end
   
  private
   
  def calculate_total_price(quantity, price)
    quantity * price
  end
end

apple1 = Apple.new(2, 300)
apple2 = Apple.new(3, 300)

puts apple1.show_quantity_price
puts apple2.show_quantity_price

# 実行結果
# りんごを2個買い、600円でした。
# りんごを3個買い、900円でした。

# ポリモーフィズム
# 類似したクラスに対するメッセージの送り方を共通にする仕組み
# また、相手が具体的にどのクラスのインスタンスであるかを意識せずにメッセージを送れる仕組み

# 継承
# 継承は、クラス定義の共通部分を別クラスにまとめて、コードの重複を排除する仕組み
# 共通部分のクラスのことをスーパークラスと呼び、それを利用するクラスをサブクラス呼ぶ

# スーパークラスとしてFruitsクラスを作成
class Fruits
  def initialize(name, quantity, price)
    @name = name
    @quantity = quantity
    @price = price
  end

  def show_quantity_price
   puts "#{@name}を#{@quantity}個買い、#{calculate_total_price(@quantity, @price)}円でした。"
  end

  private

  def calculate_total_price(quantity, price)
   quantity * price
  end
end

# Grape、OrangeクラスにFruitsクラスを継承
# オーバーライドしているshow_quantity_priceメソッドをsuperで呼び出す（ポリモーフィズム）
class Grape < Fruits
  def show_quantity_price()
    super
  end
end

class Orange < Fruits
  def show_quantity_price()
    super
  end
end

grape = Grape.new("ぶどう", 2, 300)
orange = Orange.new("オレンジ", 4 ,500)

puts grape.show_quantity_price
puts orange.show_quantity_price

# 実行結果
# ぶどうを2個買い、600円でした。
# オレンジを4個買い、2000円でした。