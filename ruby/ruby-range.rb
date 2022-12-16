# Range
# 範囲オブジェクトはリテラルで指定
# 範囲の開始値と範囲の終了値を「..」でつないで書く
range = 1..10
p range

# 範囲は数字だけではなく文字などでも可能
p 'a'..'z'

# Rangeクラスで範囲を指定する
range1 = Range.new(1, 10)  # 1から10までの範囲を持つ範囲オブジェクトrange1を作成
range2 = Range.new('a', 'z') # 文字aから文字zまでの範囲を持つ範囲オブジェクトrange2を作成
 
p range1
p range2

# 繰り返しでRangeを使用
# each
# 範囲オブジェクト（Rangeオブジェクト）はeachによる繰り返しでよく使用される
# 範囲オブジェクトに直接eachメソッドを使用し、繰り返し処理を行うことが可能
(1..5).each do |index|
  p index
end

# 実行結果：
# 1
# 2
# 3
# 4
# 5

# 範囲オブジェクトに対し、「1...5」と指定することで、最大値（ここでは5）を含まずに繰り返す
(1...5).each do |index|
  p index
end

# 実行結果：
# 1
# 2
# 3
# 4

# ブロックの中で1から10までの数の合計を計算し、その数を表示
out = 0
(1..10).each { |x| out = out + x }
p out

# 実行結果：
# 55

# for
for i in 'a'..'d'
  p i
end

# 実行結果：
# "a"
# "b"
# "c"
# "d"

# Rangeでinclude?による比較
# include?は、第一引数に値を指定すると、その値がRangeオブジェクトに含まれている場合はtrue、含まれてない場合はfalseを返す
range = 1..5
p range.include? 3
p range.include? 8

# 実行結果：
# true
# false

range = 'a'..'d'
p range.include? 'b'
p range.include? 'z'

# 実行結果：
# true
# false