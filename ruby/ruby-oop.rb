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

# ポリモーフィズム
# 類似したクラスに対するメッセージの送り方を共通にする仕組み
# また、相手が具体的にどのクラスのインスタンスであるかを意識せずにメッセージを送れる仕組み

# 継承
# 継承は、クラス定義の共通部分を別クラスにまとめて、コードの重複を排除する仕組み
# 共通部分のクラスのことをスーパークラスと呼び、それを利用するクラスをサブクラス呼ぶ

# スーパークラスとしてAnimalクラスを作成
class Animal
  def cry(voice='')
    puts "#{voice}"
  end
end

# Dog、CatクラスにAnimalクラスを継承
# オーバーライドしているcryメソッドをsuperで呼び出す（ポリモーフィズム）
class Dog < Animal
  def cry(voice='Woof woof')
    super
  end
end

class Cat < Animal
  def cry(voice='Meow meow')
    super
  end
end

dog = Dog.new
cat = Cat.new

puts dog.cry
puts cat.cry

# 実行結果
# Woof woof
# Meow meow