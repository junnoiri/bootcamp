# 文字列オブジェクトは String クラスのオブジェクト
# 数値の場合は値によってクラスが異なる

# 整数(Integer)や浮動小数点数(Float)のオブジェクトを作成
integer = Integer(12)
float = Float(12)

puts "#{integer}"
puts "#{float}"

# 実行結果
# 12
# 12.0


# 整数を浮動小数点数へ変換
# 整数を浮動小数点数に変換するには Integer クラスで用意されている to_f メソッドを使用
number1 = 10.to_f

puts "#{number1}"

# 実行結果
# 10.0


# Rational: 有理数を表すクラス
a = Rational(1, 10)
b = Rational(3, 7)
c = a + b

puts "#{a}"
puts "#{b}"
puts "#{c}"

# 実行結果
# 1/10
# 3/7
# 37/70


# 分子だけ、分母だけを出力
puts "#{c.numerator}"
puts "#{c.denominator}"

# 実行結果
# 37
# 70


# Complex: 複素数を表すクラス
d = Complex(1, 3)
puts "#{d}"

# 実行結果
# 1+3i

# 実数部と虚数部を取り出す
puts "#{d.real}"
puts "#{d.imaginary}"

# 実行結果
# 1
# 3