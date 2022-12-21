# Dateクラス
# Dateは日付を扱うことができるクラスで、時刻を扱うことはできない
require "date"
puts date = Date.today
puts date.year
puts date.month
puts date.day
puts date.wday
puts date.yday

# 実行結果:
# 2022-12-20
# 2022
# 12
# 20
# 2
# 354

# Dateクラスで指定した日付を取得する
puts date = Date.new(2018, 7, 30)

# 実行結果:
# 2018-07-30


# DateTimeクラス
# 日付と時間を扱うことができるクラス
puts date = DateTime.now
puts date.year
puts date.hour
puts date.min
puts date.sec
puts date.wday
puts date.yday
puts date.zone

# 実行結果:
# 2022-12-20T10:10:17-06:00
# 2022
# 10
# 10
# 17
# 2
# 354
# -06:00


# Timeクラス
# TimeクラスはDateTimeと同じく、日時と時間を扱うことができる
puts date = Time.now
puts date.year
puts date.hour
puts date.min
puts date.sec
puts date.wday
puts date.yday
puts date.zone

# 実行結果:
# 2022-12-20 10:12:10 -0600
# 2022
# 10
# 12
# 10
# 2
# 354
# CST