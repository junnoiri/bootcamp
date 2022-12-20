# Exception
# raise
# 例外を発生させるメソッドです。raise実行箇所より後の処理は行われずに、呼び出し元に例外発生を通知します。
# 引数に何も指定しない場合にはStandardErrorという種類の例外が発生
# raiseメソッドで「例外」が発生し、そこでプログラムを強制的に終了させて、ログをみることが可能

begin
  raise ZeroDivisionError
rescue => error
  p error.class
end

# 実行結果:
# ZeroDivisionError

# 例外を処理するbegin ~ rescueメソッド
# beginブロックで例外が発生すると、beginブロックの処理は中断され、処理のフローはrescueブロックに移る
# ZeroDivisionError
begin
  1/0
rescue
  p "Do not divide by 0"
end

# 実行結果:
# "Do not divide by 0"

# rescueでは、具体的にどんなエラーが起きたのか、その種類も捕捉することが可能
# ZeroDivisionErrorクラスはStandardErrorクラスを継承しているので、この場合は例外を捕捉することが可能
# また、eには例外オブジェクト(ZeroDivisionErrorなど)が代入されるので、それら例外オブジェクトに実装されている基本的なメソッドを使用することができる
begin
  1/0
rescue StandardError => error
  p error
  p error.class
  p error.class.superclass
end

# 実行結果:
# #<ZeroDivisionError: divided by 0>
# ZeroDivisionError
# StandardError

# 例外は複数引数に渡すことができる
# ArgumentError
# ArgumentErrorは期待されている引数の数よりも実際に渡された引数が少ないときに発生
def fullname(lastname, firstname)
  "#{lastname} #{firstname}"
end
 
begin
  1/3
  p fullname("野入")
rescue ArgumentError, ZeroDivisionError => error
  p error.class
  p error.message
end

# 実行結果:
# ArgumentError
# "wrong number of arguments (given 1, expected 2)"

# よく発生するその他の例外クラス
# NameError: 未定義のローカル変数や定数を使用したときに発生
# TypeError: メソッドの引数に期待される型ではないオブジェクトや、期待される振る舞いを持たないオブジェクトが渡された時に発生
# RuntimeError: 特定の例外クラスには該当しないエラーが起こったときに発生
# SyntaxError: ソースコードに文法エラーがあったときに発生
# NoMethodError: 定義されていないメソッドの呼び出しが行われたときに発生

# 独自の例外クラス
# 独自の例外クラスをつくるには、StandardErrorを継承する
class SampleException < StandardError
end

begin
  p "hello world"
  raise SampleException
rescue SampleException => error
  p "Catch an error"  
  p error.class
  p error.message
end

# 実行結果:
# "hello world"
# "Catch an error"
# SampleException
# "SampleException"