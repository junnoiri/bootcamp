# 文字列型変数の宣言
name1 = "jun"
puts = "#{name1}"

# Rubyでは、すべてがオブジェクト
name2 = String.new
name2 = "ken"
puts "#{name2}"

# シングルクウォーテーション,ダブルクウォーテーション　違い
# シングルクウォーテーションは特殊文字の制御は無効、ダブルクウォーテーションは特殊文字の制御は有効
fruits = 'apple\nbanana'
fruits = "apple\nbanana"

puts str1
puts str2

# 文字列の連結
fruit_name = "pineapple"
puts "こんにちは、#{fruit_name}さん"

# 文字列の中の指定した位置にある文字を取得する
# [] の中に指定した文字数の位置にある文字を取得します
city_name = "Tokyo"
puts(city_name[1]) 
