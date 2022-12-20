# Dirクラス
# Dirクラスは、ファイルそのものを扱うのではなく、ディレクトリを操作したりファイルを検索するのに使われるクラス
# Rubyをイストールすると同時に組み込まれる標準クラスなので、パッケージの追加やrequireによる読み込みは不要

# ディレクトリの作成
Dir::mkdir("./sample")

# カレントディレクトリの取得
puts Dir::pwd

# ディレクトリの削除（中身が空である時のみ削除が実行）
Dir::rmdir("sample")

# ディレクトリの名前変更
Dir::mkdir("./sample")
File.rename("sample","sample2")

# ディレクトリが存在するか確認
puts Dir::exist?("sample")

# カレントディレクトリのファイル一覧を取得
puts Dir::entries(".")

# Fileクラス
# Rubyでファイル操作を行う際、Fileクラスを利用して実装を進める
# ファイル作成: new, open
# ファイルを開く: open
# ファイルの読み込み: read
# ファイルの書き込み: puts, write
# ファイルを閉じる: close

# r: 読み込み
# r+: 読み書き 書き込み時はファイル文頭から上書き
# w: 新規書き込み
# w+: 読み書き 書き込み時は既存の内容を削除して新規作成
# a: 追記書き込み
# a+: 読み書き 書き込み時はファイル末尾に追記

# 書き込み処理には、「puts」と「write」メソッドが利用出来る
# putsとwriteの違いは、putsを利用した場合には末尾が改行されるのに対し、writeでは改行されない
file1 = File.open('sample1.txt', 'w')
file1.puts("Hello World!!")
file1.puts("Hello Ruby!!")
file1.write("Hello World")
file1.write("Hello Ruby")


# 追記処理
file1 = File.open('sample1.txt', 'a')
file1.puts("How are you doing?")

# ファイル文頭から上書きする
file1 = File.open('sample1.txt', 'r+')
file1.puts("Hey! What's up?")

# Fileの読み込み
file1 = File.open('sample1.txt', 'r')
puts(file1.read)

# Fileを閉じる
file1.close

# csv
# データをカンマ区切りにして、ファイルに保存したもの
# Rubyでcsvを扱う際はcsvというライブラリをrequireすることで操作が容易になる
require 'csv'

# 一行ずつ読み込む(foreach) ブロック内で一行ずつ配列としてcsvが読み込まれている
CSV.foreach("sample.csv") do |row|
  p row
end

# 文字列のcsvを読み込む(parse)
CSV.parse('ruby,python,java') do |row|
  puts row
end

# 全体を読み込む(read)
p CSV.read("sample.csv")

# csvの書き込み
# csvの書き込みには「openメソッド」を使用
CSV.open("write-sample.csv", "w") do |test|
  test << ["language", "product"]
  test << ["ruby", "web_application"]
  test << ["python", "AI"]
  test << ["java", "business_application"]
end

# json
# Rubyでは、他の言語と連携するためのAPIを作成するときによく使われる

# jsonの読み込み
# jsonの読み込みはJSON.loadメソッドかJSON.parseメソッドを使用
require 'json'

File.open("sample.json") do |file|
  hash = JSON.load(file)
  p hash
end

# JSON.parse
hash = JSON.parse('{"ruby":{"rails":30000},"python":{"django":25000}}')
p hash

# jsonの書き込み
# jsonの書き込みはJSON.dumpメソッドを使用
File.open("sample.json", 'w') do |file|
  hash = {"ruby"=>{"rails"=>30000}, "python"=>{"django"=>25000}}
  str = JSON.dump(hash, file)
end

# yml
# YAMLでは主に、配列、ハッシュ、スカラーの3つを組み合わせてデータを表現
# 配列: 先頭に「-」を付けて表現
# - hoge
# - foo

# ハッシュ:「キー: 値」の形式でコード化
# A: hoge
# B: foo
# C: bar

# スカラー: スカラーは大きさのみを持つ量を指す。
# Rubyでは配列やハッシュのような、他のデータを要素としてもつデータはコレクションと呼び、それ以外のデータはスカラーと呼んで区別
# それ以外のデータは具体的には文字列や数値、真偽値など
# decimal: 100 
# octal: 0234
# hexa: 0xFF 
# float1: 0.05 
# bool1: true 
# bool2: false 
# date: 2017-01-01 
# str1: 'true' 

# YAMLの読み込み
# 読み込む際にはload_file()を使用
require 'yaml'
 
puts YAML.load_file('sample.yml').join(",")

# YAMLの書き込み
# 書き込みにはdump()メソッドを使用
YAML.dump( ['hoge', 'foo', 'bar'],
File.open('sample.yml', 'w') )