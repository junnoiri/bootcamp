# メソッドの定義
# 関数には引数を持たせることが可能
def hello(first_name, last_name)
  puts "Hello #{first_name} #{last_name}!!"
end 
     
# メソッドの呼び出し
# 引数付きの時は、変数の後に()を付けて、その中に値を指定
hello('Junnosuke', 'Noiri')


# デフォルト引数
# 引数には、デフォルト値を設定することも可能
# デフォルト値を指定すると、そのメソッドを呼び出す時に、引数指定を省略できる
def hi(name='Ken', age=30)
  puts "Hi,#{name}! You are #{age} years old!"
end

# すべての引数についてデフォルト値が指定されている場合、メソッド名の後の()も省略可能
hi


# キーワード引数
# メソッド定義のところで、変数でなくてキーワードを指定する方法
# キーワード引数にも、デフォルト値を設定可能
def goodbye(first_name:, last_name:)
  puts "Good Bye, #{first_name} #{last_name}"
end

goodbye(first_name: "Kaito", last_name: "Shimizu")


# メソッドの戻り値
# returnを使って戻り値を指定
def multiple(number)
  return number * 2
end

#multipleメソッドで2倍にして戻す
multiple_number = multiple(10)
puts multiple_number


# 真偽値を返すメソッド
# present?: resent?は、値といえるものがある場合、真となる。オブジェクトに値が格納されているかを評価するときに使用

# nil?: 変数の値がnilまたは、値なしの場合、真となる

# empty?: 変数の値が""（文字列の場合）や値が空白の場合、真となる。nil?との違いは、empty?は変数の値はあることはあるが、その値が空を示している

# blank?: blank?は値といえるものがない場合、真となる

# 真偽判定のnil?、empty?はRuby標準で用意されているメソッド
# empty?
# 文字列の要素数がゼロの場合「真(true)」を返す
str = ""
puts str.empty?

# 配列の要素数がゼロの場合「真(true)」を返す
array = []
puts array.empty? 

# ハッシュの要素数がゼロの場合「真(true)」を返す
hash = {}
puts hash.empty? 

# 要素数がゼロでなければ「偽(false)」となります。
str = " "
puts " ".empty? 

array = [""]
puts array.empty? 

# nil?
# nil? メソッドは 厳密に「 nil であるかどうか」を判定する
puts nil.nil? 
puts false.nil? 
puts "".nil? 


# 破壊的メソッド
# Rubyの破壊的メソッドとはオブジェクトであるレシーバ自身の値を変更してしまうメソッド
# オブジェクトの値が変更されてしまい、当初設定したオブジェクトの値は破壊されてしまう
city_name1 = "tokyo"
puts city_name1.upcase!
puts city_name1

# 非破壊的メソッド
#反対に、非破壊的メソッドはオブジェクトであるレシーバ自身の値を変更してしまうことはない
# よって、当初設定したオブジェクトの値はそのまま保持される
city_name2 = "osaka"
puts city_name2.upcase
puts city_name2

# city_name3もcity_name4も同じオブジェクトと認識する
# 破壊的メソッドで参照するオブジェクトは変わらないまま値が変更される
city_name3 = "kyoto"
city_name4 = city_name3.upcase!
puts city_name3.object_id
puts city_name4.object_id

# city_name5もcity_name6も同じオブジェクトと認識する
# 破壊的メソッドと違い参照するオブジェクトが異なる
city_name5 = "nagoya"
city_name6 = city_name5.upcase
puts city_name5.object_id
puts city_name6.object_id


# 値渡し
# 引数は二つの方法がある。一つが値渡しで、もう一つが参照渡し
# 「値渡し」は変数の値をコピーしてメソッドを呼び出す方式
# 値渡しは、値をコピーして使用するため引数a,bの値を変更してもx,yに影響はない
def add_one(a,b)
  a += 1
  b += 1
end

x = 1
y = 2
add_one(x,y)

puts x # 値渡しなのでa+=1が影響しない
puts y # 値渡しなのでb+=1が影響しない


# 参照渡し
# 「参照渡し」は変数を共有するようにメソッドを呼び出す方式
ary = ["foo", "bar", "baz"]

def reverse(x)
  x.reverse!
end

puts ary
reverse ary
puts ary

# 'test'というStringオブジェクトを作成しstrに代入
string = 'test'
puts string.object_id

# stringの参照先をstring2にコピー（参照の値渡し）
string2 = string
puts string2.object_id

# どこからも参照されてない'test'という新しいStringオブジェクトを作成
puts 'test'.object_id

# 'test'という新しいStringオブジェクトを作成し、string2の向き先を変更
string2 = 'test'
puts string2.object_id