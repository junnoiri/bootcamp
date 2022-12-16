# Array、Hash の違い
# 1つの変数の中に、オブジェクトへの参照が順番に並んでいるものが、配列
# キーに対応した値を複数所持しているものがハッシュ

# 1~3までの数値を保持したarrya1とarray2の配列を用意し、比較
array1 = [1,2,3]
array2 = [1,2,3]

p array1 == array2

# 実行結果: 
# true

# 結果は同じ配列と見なされるのでtrueが返ってくる

# array2の中身を以下のように変更し、比較
array2 = [2,1,3]
p array1 == array2

# 実行結果: 
# false

# 同じようなケースをHashで比較
hash1 = {one: 1, two: 2, three: 3}
hash2 = {two: 2, one: 1, three: 3}
p hash1 == hash2

# 実行結果: 
# true

# あくまでハッシュは順番に並んでおらずキーを目印にバラバラに並んでいるため、trueを返す


# 配列やハッシュの基本的な操作の違い
# array
fruits_array = ["apple", "orange", "lemon"]

# hash
fruits_hash = { one: "apple", two: "orange", three: "lemon" }


# 要素の取得
# array
# 配列の要素を取得するには、配列名[インデックス番号]を使用
value1 = fruits_array[0]
p value1

# hash
# ハッシュの要素の取得はキーを使用
value2 = fruits_hash[:one]
p value2


# 要素の変更
# array
# インデックスを使用
fruits_array[0] = "grape"
p fruits_array

# hash
# キーを使用
fruits_hash[:one] = "grape"
p fruits_hash


# 要素の追加
# array
# 配列の末尾に要素を追加する
fruits_array << "banana"
p fruits_array

# hash
# 新しいキーを用意し,そこに代入
fruits_hash[:four] = "banana"
p fruits_hash