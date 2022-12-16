# 正規表現
# 正規表現とは文字列のパターンを正規式で置き換えたもので、パターン検出や抽出・変換を行うコマンドやプログラム言語で用いられる。
# Rubyは、正規表現をRegexpクラスとして定義している
# そのため正規表現を活用することで、複雑に発生する文字列のパターンマッチングを効率的に行うことが可能

# Regexpクラス
# Regexpクラスとは正規表現を利用する際に利用するオブジェクトを指す
# パターンをデリミタ'/'（スラッシュ）で囲むか、%r{}（デリミタの変更）、 
# あるいはRegexp.newまたはRegexp.compileを用い、Regexpクラスのオブジェクトを作成する。
# 用法：/\w+/ 、または %r{\w+}、または Regexp.new('\w+')、または Regexp.compile('\w+')

# メタ文字列
# メタ文字とは本来もつ文字の意味とは別に、プログラミングを行う上で定義した特別な意味を持つ文字列のことをメタ文字と呼ぶ

# 正規表現で文字列などの抽出を行う方法
# match（マッチした部分を取得する）
# matchメソッドは正規表現にマッチした部分文字列を取得するときに使用
string = "appleorangemelon"
result = string.match(/orange/)
puts result[0]

# 実行結果：
# orange

# 「*」は、検索文字列を含む文字列を取得するときに使用
string = "Hello Ruby!! Hello Rails!!"
 
result = string.match(/.*Ruby!!/)
 
puts result[0]

# 実行結果：
# Hello Ruby!!

# 文字列から数字のみを取得する
# 文字列から数字のみを取得したい場合は、「/\d+/」のように指定
# /\d+/という正規表現は、数字が1個以上並んでいる場合の文字列にマッチする
string = "AAA-012-BBB".match(/\d+/)
p string[0]
 
string = "ABC-DEF-345".match(/\d+/)
p string[0]
 
string = "678-ABC".match(/\d+/)
p string[0]

# 実行結果：
# "012"
# "345"
# "678"

# 一致した文字列の前後の値を取り出す
# pre_matchメソッド
# マッチした文字列のより前の文字列を取得することが可能
string = "Let's start learning Ruby and Ruby on Rails"
result = /and/.match(string)
p result.pre_match

# 実行結果：
# "Let's start learning Ruby "

# post_matchメソッド
# マッチした文字列のより後ろの文字列を取得
p result.post_match

# 実行結果：
# " Ruby on Rails"

# =~（マッチした部分のインデックスを返す）
# マッチしない場合はnilを返す
p /aaa/ =~ "aaabbb"
p /aaa/ =~ "rubyaaa"
p /aaa/ =~ "ruby"

# 実行結果：
# 0
# 4
# nil


# 正規表現で置換処理
# gsub, gsub!（一致した部分を全て置き換える）
# gsubとgsub!の違いは、置換対象に対して置換後の内容に上書きするかしないかの違い
# gsub
target = "hello, hello, hello Ruby"
puts target.gsub(/hello/, "morning")
puts target
 
# gsub!
target2 = "hello, hello, hello Rails"
puts target2.gsub!(/hello/, "morning")
puts target2

# 実行結果：
# morning, morning, morning Ruby
# hello, hello, hello Ruby
# morning, morning, morning Rails
# morning, morning, morning Rails

# sub, sub!（一致した最初の部分だけを置き換える）
# sub
target = "hello, hello, hello Ruby"
puts target.sub(/hello/, "morning")
puts target
 
# sub!
target2 = "hello, hello, hello Rails"
puts target2.sub!(/hello/, "morning")
puts target2

# 実行結果：
# morning, hello, hello Ruby
# hello, hello, hello Ruby
# morning, hello, hello Rails
# morning, hello, hello Rails


# 繰り返しの表現
# 0回以上の繰り返しでは"*"を使用する
# 0回以上ということはaがあってもなくてもいいのでbでも一致する 
# 一致する文字列: b ab aab
string = "bbb"
p string.gsub(/a*b/, "morning ")
 
string = "abbbabbaaaaab"
p string.gsub(/a*b/, "morning ")

# 実行結果：
# "morning morning morning "
# "morning morning morning morning morning morning "

# 1回以上の繰り返しでは"+"を使用します。
# 一致する文字列: ab aab aaab
string = "bbb"
p string.gsub(/a+b/, "morning ")
 
string = "abbbabbaaaaa"
p string.gsub(/a+b/, "morning ")

# 実行結果：
# "bbb"
# "morning bbmorning baaaaa"

# 繰り返し回数が0回か1回のときは"?"を使用
# 一致する文字列: b ab
string = "bbb"
p string.gsub(/a?b/, "morning ")

 
string = "aab"
p string.gsub(/a?b/, "morning ")

# 実行結果：
# "morning morning morning "
# "amorning "

# 繰り返し回数がちょうどn回のときは{n}を使用
# 一致する文字列: bbb
string = "bbb"
p string.gsub(/b{3}/, "morning ")
 
string = "bb"
p string.gsub(/b{3}/, "morning ")

# 実行結果：
# "morning "
# "bb"

# 繰り返し回数がn回以上のときは{n,}を使用
# 一致する文字列: bb bbb bbbb bbbbb
string = "bbb"
p string.gsub(/b{2,}/, "morning ")
 
string = "bb"
p string.gsub(/b{2,}/, "morning ")

# 実行結果：
# "morning "
# "morning "


# 文字クラスの省略記法
# a-z、A-Z、0-9のうちのいずれか1文字に一致する場合はwを使用
string = "9a"
p string.gsub(/wa/, "morning")
 
string = "Za"
p string.gsub(/wa/, "morning")

# 実行結果：
# "9a"
# "Za"
