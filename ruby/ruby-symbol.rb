# Symbol
# 使い方
# 文字列
string = "string"

# シンボル
symbol = :symbol

# 前置コロンと後置コロン
# ハッシュのキーとしてシンボルを使う際や、キーワード引数を使う際に、コロン記号「:」を後置する
# シンボルはハッシュやアクセサ、ブロック引数などに使用される
# 特にハッシュでのキーとしてよく使用（意味のある名前をキーに設定したいときにシンボルを使用）

# シンボルと文字列の違い
# シンボルはSymbolクラスのオブジェクトで、文字列はStringクラスのオブジェクト
puts :Ruby.class
puts 'Ruby'.class

# シンボルは必ず同一のオブジェクトとなり、オブジェクトの数が増えないためメモリの使用効率がよくなる。
puts :Ruby.object_id
puts :Ruby.object_id 
# 実行結果
# 1045348
# 1045348

puts 'Ruby'.object_id
puts 'Ruby'.object_id 
# 実行結果
# 60
# 80

# シンボルはimmutable(変更不可)なオブジェクトのため、文字列のように破壊的な変更ができない
name_symbol = :Jun
puts name_symbol.upcase!

# 実行結果
# undefined method `upcase!' for :Jun:Symbol (エラーが生じる)

# 文字列は破壊的な変更が可能
name_string = 'Jun'
puts name_string.upcase!

# 実行結果
# JUN

# シンボルを使用するメリット
# メモリ消費が少ない/ 処理が高速になる
# シンボルは内部で整数として管理されるため、文字列と比べて高速に処理できる。

# 可読性が上がる
# 通常のハッシュ
dog = { "name" => "pochi", "kind" => "shibaken" }

# シンボルを使用したハッシュ
dog = {name: "pochi", kind: "shibaken" }
