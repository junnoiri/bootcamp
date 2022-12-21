# Array
# 配列の基本形

# 初期化
array = []
puts 'No.1:' + array.to_s

# 次のような記述も可能
# 長さを指定して配列を定義したい時に使用
array = Array.new()
puts 'No.2:' + array.to_s

# サイズを指定して初期化
array = Array.new(3)
puts 'No.3:' + array.to_s
 
# サイズと要素を指定して初期化
array = Array.new(3, 'jun')
puts 'No.4:' + array.to_s

# 実行結果
# No.1:[]
# No.2:[]
# No.3:[nil, nil, nil]
# No.4:["jun", "jun", "jun"]

# 要素の取得
# 配列の要素を取得するには、配列の入った変数に対して[]演算子にインデックス（添え字）を指定
fruits_array = ['Banana', 'Apple', 'Grape', 'Strawberry']
puts 'No.1:' + fruits_array[0].to_s
puts 'No.2:' + fruits_array[1].to_s
puts 'No.3:' + fruits_array[2].to_s
puts 'No.4:' + fruits_array[3].to_s

# 実行結果
# No.1:Banana
# No.2:Apple
# No.3:Grape
# No.4:Strawberry

# 要素の追加
# 配列に要素を追加するには、配列の入った変数に[]演算子で存在しないインデックスを指定し、それに対し値を代入
fruits_array[4] = 'Melon'

# 配列全体を表示
puts fruits_array.to_s

# 実行結果
# ["Banana", "Apple", "Grape", "Strawberry", "Melon"]

# 簡単に配列に要素を追加する方法として、配列のpushメソッドがある
# pushメソッドは、配列の末尾に指定した値を追加する
fruits_array.push('Orange')
puts fruits_array.to_s

# 実行結果
# ["Banana", "Apple", "Grape", "Strawberry", "Melon", "Orange"]

# 要素の更新
puts fruits_array[0].to_s

# [0]の要素を更新
fruits_array[0] = "Peach"
puts fruits_array[0].to_s
puts fruits_array.to_s

# 実行結果
# Banana
# Peach
# ["Peach", "Apple", "Grape", "Strawberry", "Melon", "Orange"]

# 要素の削除
# 配列の要素を削除するには、配列のdeleteメソッドを使用

# 同じ要素を全て削除
fruits_array.delete("Grape")
puts fruits_array.to_s

# インデックスの1から2個の要素を削除
fruits_array[1, 2] = []
puts fruits_array.to_s

# 実行結果
# ["Peach", "Apple", "Strawberry", "Melon", "Orange"]
# ["Peach", "Melon", "Orange"]

# 配列演算子
# &（積集合）
# &（積集合）は2つの配列の積集合を作成。2つの配列の要素から一致する要素を取得して、新しい配列を作成
array_1 = [1, 1, 2, 2, 3, 3, 4, 5, 7]
array_2 = [1, 2, 3, 3, 6, 7, 8]
p array_1 & array_2 

# 実行結果 
# [1, 2, 3, 7]

# *（配列の内容を繰り返した配列を作成）
# *（乗算）を使用すると、同じ要素を繰り返した配列を作成
array_3 = [1, 2, 3]
p array_3 * 5

# 実行結果 
[1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3]

# +（配列どうしを連結）
# 加算を使用し、配列同士を連結することが可能
string_array = ["Samurai", "Ruby", "Rails"]
p array + ["Swift", "Java"] 

# 実行結果 
# ["Samurai", "Ruby", "Rails", "Swift", "Java"]

# -（差集合）
# 減算（-）を使用し、重複している要素が取り除かれた配列を作成
p array_1 - array_2

# 実行結果 
# [4, 5]

# |（和集合）
# | を配列で使用し、重複している要素が取り除かれた配列を作成
p array_1 | array_2

# 実行結果 
# [1, 2, 3, 4, 5, 7, 6, 8]

# 繰り返し処理
# eachメソッド
# eachメソッドは{}で囲まれた範囲を引数とする
fruits_array.each{|fruit|
  puts fruit
}

# do...endと{}の違い
# do endより{}の方が結合が強い

# {}が使用されるケース
# ブロック付きメソッドがインラインの場合
[1, 2, 3].each{|e| puts e}

# ブロック付きメソッドの戻り値を利用する場合
numbers = [1, 2, 3].map{|numbers| numbers ** 3}

# ブロック付きメソッドからさらにメソッドチェーンする場合
(1..10).select{|e| e.even?}.map{|e| e ** 3}

# リソース管理のためにブロックを使う場合

# do...endが使用されるケース
# 上記以外の場合、基本こちらを使うべき

# each_with_indexメソッド
# each_with_indexメソッドは下記のようにブロック引数を２つ取ることが可能
# 配列に対してループ処理を行う
fruits_array = ['Banana', 'Apple', 'Grape', 'Strawberry']
fruits_array.each_with_index{|fruit, index|
  # 実行する処理1(１つ目のブロック引数がfruiteで配列の各要素を表す)
  puts fruit

  # 実行する処理2(２つ目のブロック引数には添字の番号が入る)
  puts index
}

# Mapメソッド
# mapメソッドはブロック内の式を実行した結果を返す。
# eachとmapの違いはmapメソッドはブロックごとに処理された結果(戻り値)を集めた配列を返す

numbers = [1, 2, 3, 4, 5, 6]
p numbers.map{|number| number * 3}

# 出力結果
# [3, 6, 9, 12, 15, 18]

numbers.each{|number|
  p number * 3
}

# 出力結果
# 3
# 6
# 9
# 12
# 15
# 18

# Method chain
# メソッドを連続的に呼び出すことをメソッドチェインという
# "hello_word"という文字列を"_"で分割して配列wordsに格納
string = "hello_world"
words = string.split("_")

words = words.map{|word| word.capitalize}

# Array.joinで文字列を連結し、出力
string = words.join(" ")
puts string

# string.split、array.mapの戻り値はどっちもArray
# そのため、method chainを利用してこれらを連続的に記述
puts string = "hello_world".split("_").map{|word| word.capitalize}.join(" ")

# 出力結果
# Hello World
# Hello World

# メソッドチェインでは戻り値の種類を意識することが必要
