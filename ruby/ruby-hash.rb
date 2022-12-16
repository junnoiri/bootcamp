# Hash
# ハッシュはオブジェクトがキーとバリューの二つ入っているのが特長
fruits_hash = {"apple": '100円', "orange": '80円', "melon": '500円'}
p fruits_hash

# 実行結果：
# {:apple=>"100円", :orange=>"80円", :melon=>"500円"}


# 要素の取得
# ハッシュ[設定したキー]で取り出す
fruits_hash = {"apple": '100円', "orange": '80円', "melon": '500円'}
p fruits_hash[:apple]
p fruits_hash[:"orange"]
p fruits_hash[:"pineapple"]

# 実行結果：
# "100円"
# "80円"
# nil

# fetchメソッドを使って取り出す
# fetchでは、キーが設定されていない場合例外を返すようになっています。
p fruits_hash.fetch(:apple)
p fruits_hash.fetch(:orange)
p fruits_hash.fetch(:pineapple, '600円')

# 実行結果：
# "100円"
# "80円"
# "600円"


# 要素の追加
# 基本的にはハッシュ[:新しいキー] = 新しいバリューの形式で値を追加することが可能
p fruits_hash
fruits_hash[:pineapple] = '600円'
p fruits_hash

# 実行結果：
# {:apple=>"100円", :orange=>"80円", :melon=>"500円"}
# {:apple=>"100円", :orange=>"80円", :melon=>"500円", :pineapple=>"600円"}

# storeメソッドを使っても同様に追加することも可能
fruits_hash = {"apple": '100円', "orange": '80円', "melon": '500円'}
fruits_hash.store(:lemon,'200円')
p fruits_hash

# 実行結果：
# {:apple=>"100円", :orange=>"80円", :melon=>"500円", :lemon=>"200円"}


# 要素の削除
# 基本的な要素の削除はdeleteメソッドを使用
p fruits_hash
fruits_hash.delete(:lemon)
p fruits_hash

# 実行結果：
# {:apple=>"100円", :orange=>"80円", :melon=>"500円", :lemon=>"200円"}
# {:apple=>"100円", :orange=>"80円", :melon=>"500円"}


# 要素の更新
p fruits_hash
fruits_hash[:melon] = "200円"
puts fruits_hash

# 実行結果：
# {:apple=>"100円", :orange=>"80円", :melon=>"500円"}
# {:apple=>"100円", :orange=>"80円", :melon=>"200円"}


# 繰り返し処理
# each メソッド
# ハッシュに含まれる要素毎に「キー」と「値」を順にブロックに渡して繰り返し処理を行う
fruits_hash = {"apple": '100円', "orange": '80円', "melon": '500円'}
fruits_hash.each do |key, value|
  puts "#{key} => #{value}"
end

# 実行結果：
# apple => 100円
# orange => 80円
# melon => 500円

# each_keyメソッド
# ハッシュに含まれる要素毎に「キー」を順にブロックに渡して繰り返し処理を行う
fruits_hash.each_key do |key|
  puts "key = #{key}"
end

# 実行結果：
# key = apple
# key = orange
# key = melon

# each_valueメソッド
# ハッシュに含まれる要素毎に「値」を順にブロックに渡して繰り返し処理を行う
fruits_hash.each_value do |value|
  puts "value = #{value}"
end

# 実行結果：
# value = 100円
# value = 80円
# value = 500円

# sort (ハッシュをkeyでソートする)
p fruits_hash.sort
p fruits_hash

# keys(ハッシュのkeyを配列で取得する)
key = fruits_hash.keys
p key

# 実行結果：
# [:apple, :orange, :melon]

# values(ハッシュのvalueを配列で取得する)
value = fruits_hash.values
p value

# 実行結果：
# ["100円", "80円", "500円"]

# has_key (ハッシュにkeyが存在するか確かめる)
# ハッシュ内に存在しないkeyを指定すると、nil値が返ってきます
if fruits_hash.has_key? :orange then
  puts 'fruits_hash has key orange'
else
  puts 'fruits_hash dose not have key orange'
end

# 実行結果：
# fruits_hash has key orange

# has_value (ハッシュにvalueが存在するか確かめる)
if fruits_hash.has_value? "200円" then
  puts 'fruits_hash has value 200円'
else
  puts 'fruits_hash dose not have value 200円'
end

# 実行結果：
# fruits_hash dose not have value 200円


# Method chain
# to_aでハッシュから二次元配列へ変換し、assocメソッドで特定の配列を取得する
fruits_hash = {"apple": '100円', "orange": '80円', "melon": '500円'}
p fruits_array = fruits_hash.sort.to_a.assoc(:apple)

# 実行結果：
# [:apple, "100円"]