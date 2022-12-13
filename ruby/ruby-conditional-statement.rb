# - if
age = 18
if age < 20 then
  puts 'あなたはまだ未成年です'

elsif age >= 60  then
  puts 'あなたは還暦です'

else 
  puts 'あなたは成人です'    

end

# - unless
# 「〜では無い場合」の条件を処理する方法
# unlessはelseと併用することも可能
# ただし、elsifとは併用できない
name = 'jun'
unless name == 'jun'
  puts "あなたは#{name}ではないです。"
  
else
  puts "あなたは#{name}です。"

end

# - case
day_week = 'Tuesday'
case day_week 
when 'Monday' then
  puts '今日は月曜日です'

when 'Tuesday' then
  puts '今日は火曜日です'

when 'Wednesday' then
  puts '今日は水曜日です'

when 'Thursday' then
  puts '今日は木曜日です'

when 'Friday' then
  puts '今日は金曜日です' 

when 'Saturday' then
  puts '今日は土曜日です'    

else
  puts '今日は日曜日です'

end

# - 真偽値の定義
# Rubyにおいて、真偽値は次のように定義されている。
# 偽: false または nil
# 真: 偽値ではない全て

number = 2

if number.odd?
  puts '奇数です'

else 
  puts '偶数です'     

end  

# - conditional statementの戻り値
# if文は条件に対応した節が戻り値となる
age = 20

result = 
if age < 20 then
  'あなたはまだ未成年です'
  
elsif age >= 60  then
  'あなたは還暦です'
  
else 
  'あなたは成人です'    
  
end

puts "#{result}"

# case文は真となった条件の節の値が戻り値となる
product = "refrigerator"
 
discount_rate =
case product
when "refrigerator" then
  0.3

when "PC" then
  0.2

else
  0.1
  
end
 
puts "#{discount_rate * 100}% off"





