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
  def accel
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
puts car1.accel
puts car2.color
puts car3.accel
puts car4.speed
puts car5.accel

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
   
  def result
    puts "りんごを#{@quantity}個買い、#{calculation(@quantity, @price)}円でした。"
  end
   
  private
   
  def calculation(quantity, price)
    quantity * price
  end
end

apple1 = Apple.new(2, 300)
apple2 = Apple.new(3, 300)

puts apple1.result
puts apple2.result

# 実行結果
# りんごを2個買い、600円でした。
# りんごを3個買い、900円でした。

# ポリモーフィズム
# 類似したクラスに対するメッセージの送り方を共通にする仕組み
# また、相手が具体的にどのクラスのインスタンスであるかを意識せずにメッセージを送れる仕組み

# 継承
# 継承は、クラス定義の共通部分を別クラスにまとめて、コードの重複を排除する仕組み
# 共通部分のクラスのことをスーパークラスと呼び、それを利用するクラスをサブクラス呼ぶ

# スーパークラスとしてShoppingクラスを作成
class Shopping
  def initialize(quantity, price)
   @quantity = quantity
   @price = price
  end

  def result(product='')
   puts "#{product}を#{@quantity}個買い、#{calculation(@quantity, @price)}円でした。"
  end

  private

  def calculation(quantity, price)
   quantity * price
  end
end

# Grape、OrangeクラスにShoppingクラスを継承
# オーバーライドしているresultメソッドをsuperで呼び出す（ポリモーフィズム）
class Grape < Shopping
  def result(product='ぶどう')
    super
  end
end

class Orange < Shopping
  def result(product='オレンジ')
    super
  end
end

grape = Grape.new(2, 300)
orange = Orange.new(4 ,300)

puts grape.result
puts orange.result

# 実行結果
# ぶどうを2個買い、600円でした。
# オレンジを4個買い、1200円でした。