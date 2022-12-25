class TrackTime
  attr_accessor :task_name, :start_time, :end_time, :actual_time

  def initialize(task_name, start_time: "", end_time: "", actual_time: "")
    @task_name = task_name
  end

  # タスクの開始を記録
  def record_start_time
    @start_time = Time.now
    @log_start_time = "タスク(#{@task_name})開始時刻: #{@start_time.strftime('%Y年%m月%d日 %H時%M分%S秒')}"
    puts @log_start_time

    # ログファイルを作成し、タスクの開始をログファイルに記録
    @task_log = File.open("../log/202212/#{@start_time.strftime('%Y%m%d')}.txt", "a")
    @task_log.puts("#{@log_start_time}")
    @task_log.close
    
  end

  # タスクの終了を記録
  def record_end_time
    @end_time = Time.now
    @log_end_time = "タスク(#{@task_name})終了時刻: #{@end_time.strftime('%Y年%m月%d日 %H時%M分%S秒')}"
    puts @log_end_time

    # タスクの終了をログファイルに記録
    @task_log = File.open("../log/202212/#{@end_time.strftime('%Y%m%d')}.txt", "a")
    @task_log.puts("#{@log_end_time}")
    @task_log.close
  end

  def record_actual_time

    @actual_time = (@end_time - @start_time).floor / 60
    @log_actual_time = "タスク(#{@task_name})実績時間: #{@actual_time}分}"
    puts @log_actual_time
    
    # タスクの実績時間をログファイルに記録
    @task_log = File.open("../log/202212/#{@actual_time.strftime('%Y%m%d')}.txt", "a")
    @task_log.puts("#{@log_actual_time}")
    @task_log.close
  end

  def find_todqys_log_file
    @date_today = Time.now.strftime('%Y%m%d')
    @today_log_file = Dir.glob("#{@date_today}*")  
  end

  # 本日のタスク一覧（タスク名、開始時間、終了時間、実績時間）と本日の作業合計時間を表示
  def show_today_tasks
    record_actual_time
    puts "本日のタスク一覧"
    

    puts "タスク名: #{@task_name}\n開始時間: #{@log_start_time}\n終了時間: #{@log_end_time}\n実績時間: #{@actual_time}分"
    puts "本日の作業合計時間: "
  end  
end

class Option
  def check_option(option_kind)
    case option_kind
      when "-s", "--start"
        record_start_time
      when "-f", "--finish"
        record_end_time
      when "-vt", "--view-total"
        show_todays_tasks
      when "-vw", "--view-week"
        show_week_tasks
      else
       puts "the entered option is not correct, Please follow the instructions below.
       [-s <task_name>] / [--start <task_name>] : Record task start time\n
       [-f <task_name>] / [--finish <task_name>] : Record task completion time\n
       [-vt] / [--view-today] : Display today's task list (task name, start time, end time, actual time) and total work time for today\n
       [-vw] / [--view-week] : Displays daily work hours for the last 7 days"
    end
  end
  
  def record_start_time
    track_time = TrackTime.new(ARGV[1])
    track_time.record_start_time
  end

  def record_end_time
    track_time = TrackTime.new(ARGV[1])
    track_time.record_end_time
  end

  def show_todays_tasks
    track_time = TrackTime.new(ARGV[1])
    track_time.show_today_tasks

  end

  def show_week_tasks
  end
end

option = Option.new
option.check_option(ARGV[0])