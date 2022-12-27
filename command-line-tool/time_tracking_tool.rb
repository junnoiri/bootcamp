require 'time'

class TimeManagement
  attr_accessor :task_name
  ONE_WEEK = 7

  def initialize(task_name = "")
    @task_name = task_name
    @timestamp = Time.now
  end

  # ログファイルを作成し、記録
  def record_log(log)
    task_log = File.open("../log/202212/#{@timestamp.strftime('%Y%m%d')}.txt", "a")
    task_log.puts("#{log}")
    task_log.close
  end  

  # タスクの開始を記録
  def record_start_time
    log_start_time = "タスク(#{@task_name})開始時刻: #{@timestamp.strftime('%Y年%m月%d日 %H時%M分%S秒')}"
    puts log_start_time

    # タスクの開始をログファイルに記録
    record_log(log_start_time)
  end

  # タスクの終了を記録
  def record_end_time
    log_end_time = "タスク(#{@task_name})終了時刻: #{@timestamp.strftime('%Y年%m月%d日 %H時%M分%S秒')}"
    puts log_end_time

    # タスクの終了をログファイルに記録
    record_log(log_end_time)

    # タスクの終了時間を記録後、タスクの実績時間を記録
    record_actual_time
  end

  # 実行した日付のログファイルを探索
  # task_nameが含まれる特定の行（開始時刻・終了時刻）を抽出し、配列として値を返す。
  def find_today_log
    log_lines = []
    File.foreach("../log/202212/#{@timestamp.strftime('%Y%m%d')}.txt"){ |line|
      if (line.include?("#{@task_name}"))
        line = /時刻: /.match(line).post_match.chomp
        log_lines << Time.strptime(line,'%Y年%m月%d日 %H時%M分%S秒')
      end
    }
    p log_lines
    return  log_lines
  end

  # タスクの実績時間を記録
  def record_actual_time
    log_lines = find_today_log

    # 実績時間を計算
    actual_time = (log_lines[1]  - log_lines[0] ).floor/60
    log_actual_time = "タスク(#{@task_name})実績時間: #{actual_time}分"
    
    # タスクの実績時間をログファイルに記録
    record_log(log_actual_time)
  end

  # 作業合計時間を記録
  def record_total_work_time
    total_work_time = 0
    File.foreach("../log/202212/#{@timestamp.strftime('%Y%m%d')}.txt"){ |line|
      if (line.include?("実績時間:"))
        line = /実績時間: /.match(line).post_match.chomp
        total_work_time += line.to_i
      end
    } 
    total_work_time = "作業合計時間: #{total_work_time}分"

    # 作業合計時間をログファイルに記録
    record_log(total_work_time)
  end

  # 本日のタスク一覧（タスク名、開始時間、終了時間、実績時間）と本日の作業合計時間を表示
  def show_today_tasks
    # 作業合計時間を記録
    record_total_work_time
    
    # タスク一覧を表示
    puts "本日のタスク一覧"
    log_file = File.open("../log/202212/#{@timestamp.strftime('%Y%m%d')}.txt", "r")
    puts log_file.read
    log_file.close
  end 

  # 直近7日間の日別作業時間を表示
  def show_week_tasks
    # 直近7日間のログファイルを探索
    ONE_WEEK.times { 
      File.foreach("../log/202212/#{@timestamp.strftime('%Y%m%d')}.txt"){ |line|
        if (line.include?("作業合計時間:"))
          puts "#{@timestamp.strftime('%Y年%m月%d日')} #{line}"
        end
      } 
      @timestamp += 60*60*24
    }
  end
end

class Option
  def check_option(option_kind)
    time = TimeManagement.new(ARGV[1])
    case option_kind
      when "-s", "--start"
        time.record_start_time
      when "-f", "--finish"
        time.record_end_time
      when "-vt", "--view-total"
        time.show_today_tasks
      when "-vw", "--view-week"
        time.show_week_tasks
      else
       puts "the entered option is not correct, Please follow the instructions below.
       [-s <task_name>] / [--start <task_name>] : Record task start time\n
       [-f <task_name>] / [--finish <task_name>] : Record task completion time\n
       [-vt] / [--view-today] : Display today's task list (task name, start time, end time, actual time) and total work time for today\n
       [-vw] / [--view-week] : Displays daily work hours for the last 7 days"
    end
  end
end

option = Option.new
option.check_option(ARGV[0])