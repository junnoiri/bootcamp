# Class
# クラス（class）とは、メソッドなどの処理を入れる入れ物のようなもの
# インスタンス変数: 変数の初めに「@」をつけることで宣言を行うことが可能
class User
  def name
    @name
  end
   
  def name=(name)
    @name = name
  end
end

# Userという型（クラス）の値をnewで作成し変数userへ代入(インスタンス化)
user1 = User.new
user2 = User.new

# userにはUser型の値が入っている
p user1
p user2
 
user1.name = "jun"
user2.name = "ken"
p user1.name 
p user2.name

# 実行結果:
# #<User:0x00007fa62305f160>
# #<User:0x00007fa62305eff8>
# "jun"
# "ken"

# クラスのinitialize
# Rubyのクラスのinitializeメソッドはクラスがnewされた際に一度だけ実行されるメソッド(クラスの初期化)
# initializeは複数定義してオーバーロードできない
class Hello 
  def initialize(username)
    @username = username
  end
    
  def hello
    puts "hello, " + @username.to_s
  end
end

h = Hello.new("Jun")

h.hello

# クラスメソッド
# メソッド名の先頭に「self.」をつける
# クラス変数: 変z数目の初めに「@@」をつけることで宣言、クラスから作成したすべての変数（インスタンス）が共通して持っている変数
class Counter
  @@count = 0
    
  def initialize(counter_name)
    @@count+=1
    @counter_name = counter_name
  end
    
  def self.counter_number
    @@count
  end
    
  def self.counter_name
    @counter_name
  end
end
   
count1 = Counter.new("apple")
count2 = Counter.new("banana")
count3 = Counter.new("cookie")
   
p Counter.counter_number
p Counter.counter_name

# クラスメソッドからインスタンス変数にはアクセスできないため、結果はnilになる
# 実行結果:
# 3
# nil

# インスタンスメソッド
# インスタンスメソッドからは、クラス変数、インスタンス変数ともにアクセスが可能
class Counter
  @@count = 0
      
  def initialize(counter_name)
    @@count+=1
    @counter_name = counter_name
  end
      
  def counter_number
    @@count
  end
      
  def counter_name
    @counter_name
  end
end
     
count1 = Counter.new("apple")
count2 = Counter.new("banana")
count3 = Counter.new("cookie")
     
p count3.counter_number
p count1.counter_name
p count2.counter_name
p count3.counter_name

# 実行結果:
# 3
# "apple"
# "banana"
# "cookie"

# アクセサ
# Rubyではそのままだとインスタンス変数にアクセスできない
class Human
  def initialize(name)
    @name = name
  end
end
 
# human = Human.new('jun')
# puts human.name

# 実行結果:(エラー)
# undefined method `name' for #<Human:0x00007fb3698fbc58 @name="jun"> (NoMethodError)


# アクセサメソッド
# アクセサメソッドは次の2つ: attr_reader/ attr_writer
# attr_readerはインスタンス変数にアクセスするためのゲッター
# attr_writerはインスタンス変数にアクセスするこめのセッター

# attr_reader(ゲッター)
# インスタンス変数@nameにアクセスが可能
class User
  attr_reader :name
  def initialize(name)
    @name = name
  end
end
   
user = User.new("taro")
puts user.name

# 実行結果:
# taro

# attr_readerのみだと、セッターが定義されていないので、@nameをクラスの外部から変更することができない
# attr_writer(セッター)
# セッターにより、外部からインスタンス変数@nameを変更し、アクセスすることが可能
class User
  attr_writer :name
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
   
user = User.new("kuro")
puts user.name
user.name = "siro"
puts user.name

# 実行結果:
# kuro
# siro

# attr_accessor(ゲッターとセッターの両方を同時に設定)
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
   
user = User.new("kuro")
puts user.name
user.name = "siro"
puts user.name

# 実行結果:
# kuro
# siro

# アクセス修飾子
# アクセス修飾子には以下の３つがあります。
# public
# publicメソッドはオブジェクトから直に呼び出すことが可能

# private
# クラス外部には公開されないメソッドでクラス内のメソッドから呼び出して使われるメソッド
# private以下に記載し、呼び出す際は「self」をつけない関数形式で呼び出す

# protected
# 基本的に「private」メソッドと同様にクラス外部には公開されないメソッドでクラス内のメソッドから呼び出して使われるメソッド
# protectedの場合は「self」をつけて呼び出すことが可能
class User
  def uesr_method
    protected_method
    self.protected_method

    private_method
    self.private_method
  end

  protected

  def protected_method
    puts 'protected'
  end

  private

  def private_method
    puts 'private'
  end
end