# module
# モジュールはインスタンス化能力はないが、メソッドを格納できるもの
module Number
  def plus(number1, number2)
    number1 + number2
  end
end

# クラスの継承では機能の流用・変更・追加が可能
# ただし、クラス間には、「継承」関係が必要で、親クラスと子クラスは継承関係の「定義」により固く結びついている必要がある
# モジュールは継承関係を使用せずに、機能の流用・変更・追加をすることができる

# 名前空間
# 名前空間とは、メソッド名や変数名などが衝突しないようにするための機能のこと
# Rubyでは同じメソッドが多重に定義された場合、エラーにはならずにどちらかのみが有効なメソッドとして動作
# このような名前の衝突(同名での定義)を防ぐために、モジュール(module)を使用することができる

# 例えば「name」メソッドを同じプログラムで二つ用意したい場合、モジュールで名前空間を分けることで定義が可能
# モジュール内のメソッドを実行するには「module_function :メソッド名」のように、module_functionでモジュール名を指定する必要がある
module Dog
  def name
  end
end
 
module Cat
  def name
  end
end

module Test
  def Min(x, y)
    if x < y
      return x
    else
      return y
    end
  end
 
  def Max(x, y)
    if x > y
      return x
    else
      return y
    end
  end
 
  module_function :Min
  module_function :Max
end

# モジュールを実行する
puts Test.Min(1, 5)
puts Test.Max(1, 5)

# 実行結果:
# 1
# 5

# include
# includeはモジュールの性質を他のクラスに追加するために使用されるメソッド
# includeメソッドはインスタンスメソッドとして取り込むことになる
module Sayhello
  def hello
    p 'hello'
  end
end
 
class Sayhello_2
  include Sayhello
end
 
test = Sayhello_2.new
test.hello

# 実行結果:
# "hello"

# extend
# extendメソッドはある特定のオブジェクトに対して、モジュールの機能を追加したい時に使用
# extendメソッドはオブジェクトに取り込まれた後で呼び出すこととなるため、クラスメソッドとして取り込むことになる
module Apple
  def test
    puts "Apple"
  end
end

class Fruit
end

fruit = Fruit.new
fruit.extend(Apple)
fruit.test

# 実行結果:
# Apple

# prepend
# prependもincludeと同じようにモジュールに定義したメソッドをクラスに、ミックスインして使う
# includeとprependの違いは呼び出す順番にある
# includeの場合はincludeしてあるクラスから呼び出され次にモジュールが呼ばれるのに対して、
# prependの場合はモジュールが先に呼ばれて次にクラスが呼ばれる

# この違いにより、prependではモジュールのメソッドが優先される
# prependを使うことによって、既存のメソッドをオーバーライドできる
module Banana
  def test
    puts "Banana" 
  end
end

class Fruit
  include Banana

  def test
    puts "Lemon"
  end
end

fruit = Fruit.new
fruit.test

# クラスメソッドが優先されて実行される
# 実行結果:
# Lemon

module Grape
  def test
    puts "Grape" 
  end
end

class Fruit
  prepend Grape

  def test
    puts "Lemon"
  end
end

fruit = Fruit.new
fruit.test

# モジュールメソッドが優先されている
# 実行結果:
# Grape