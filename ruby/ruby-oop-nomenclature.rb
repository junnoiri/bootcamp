# クラス名、モジュール名
# ClassNameというように、単語の先頭を大文字で定義
# キャメルケース(CamelCase)：各単語の頭文字を大文字にする、_は使用しない
# ただし、HTMLやFTPなどの略語はすべて大文字

# メソッド名、変数名
# メソッド名は、method_nameのように２単語目以降は、アンダーバーで示す（snake_case）
# スネークケース(snake_cace)：すべてを小文字にし、単語の区切りを_で繋ぐ

class Name
  def full_name
  end
end

instance = Name.new
instance.full_name

# 定数名
# スクリーミングスネークケース(SCREAMING_SNAKE_CASE)：すべてを大文字にし、単語の区切りを_で繋ぐ

# 返り値が真偽値のメソッド
# 真偽を返すメソッドであれば最後に?を付与する
# 冗長になるためメソッドの先頭にisやdoes、またcanなどの助動詞を置かないようにする

# 破壊的なメソッド
# selfや引数を変更するようなメソッドは最後に!を付与する

# クラス変数
# そのクラス内で定義される変数で、@@変数名と記述して定義
# クラス変数は、クラスとして共通の変数を定義したいときに使う

# インスタンス変数
# 個別のインスタンスに定義できる変数で、@変数名と記述して定義
# インスタンス変数は定義したインスタンスメソッドとは別のインスタンスメソッドの中でも使用することができる
# オレンジ、リンゴ、ぶどうのインスタンスを生成するたびにクラス変数@@price に各フルーツの価格が合算され、sumメソッドで合計金額を出力
class Fruits
  @@price = 0

  def initialize(fruit, price)
    @fruit = fruit
    @@price += price
  end

  def sum
    puts "合計金額は#{@@price}円です"
  end
end

orange = Fruits.new("オレンジ", 200)
apple = Fruits.new("リンゴ", 300)
grape = Fruits.new("ぶどう", 500)

grape.sum

# 実行結果:
# 合計金額は1000円です