# Array
# 配列の基本形

# 初期化
array = []
puts 'No.1:' + array.to_s

# 次のような記述も可能
# 長さを指定して配列を定義したい時に使用
array = Array.new()
puts 'No.2:' + array.to_s

#サイズを指定して初期化
array = Array.new(3)
puts 'No.3:' + array.to_s
 
#サイズと要素を指定して初期化
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




