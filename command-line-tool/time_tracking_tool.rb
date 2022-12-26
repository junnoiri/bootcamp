require 'time'

class TrackTime
  attr_accessor :task_name, :start_time, :end_time, :actual_time

  def initialize(task_name, start_time: "", end_time: "", actual_time: "")
    @task_name = task_name
    @timestamp = Time.now
  end

  def record_log(work_time)
    # ログファイルを作成し、記録
    task_log = File.open("../log/202212/#{@timestamp.strftime('%Y%m%d')}.txt", "a")
    task_log.puts("#{work_time}")
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
  end

  def find_task_log
    log_lines = []
    File.foreach("../log/202212/#{@timestamp.strftime('%Y%m%d')}.txt"){ |line|
      line = /: /.match(line).post_match.chomp
      log_lines << Time.strptime(line,'%Y年%m月%d日 %H時%M分%S秒')
    }
    p log_lines
    return  log_lines
  end

  # タスクの実績時間を記録
  def record_actual_time
    log_lines = find_task_log
    @start_time = log_lines[0] 
    @end_time = log_lines[1] 
    @actual_time = (@end_time - @start_time).floor/60
    log_actual_time = "タスク(#{@task_name})実績時間: #{@actual_time}分"
    
    # タスクの実績時間をログファイルに記録
    record_log(log_actual_time)
  end

  def record_total_work_time
    

  end

  # 本日のタスク一覧（タスク名、開始時間、終了時間、実績時間）と本日の作業合計時間を表示
  def show_today_tasks
    record_actual_time
    puts "本日のタスク一覧"
    # puts "タスク名: #{@task_name}\n開始時間: #{@start_time}\n終了時間: #{@end_time}\n実績時間: #{@actual_time}分"
    log_file = File.open("../log/202212/#{@timestamp.strftime('%Y%m%d')}.txt", "r")
    puts log_file.read
    puts "本日の作業合計時間: "
    log_file.close      
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
        view_today_tasks
      when "-vw", "--view-week"
        view_week_tasks
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

  def view_today_tasks
    track_time = TrackTime.new(ARGV[1])
    track_time.show_today_tasks
  end

  def view_week_tasks
    track_time = TrackTime.new(ARGV[1])
    track_time.show_week_tasks
  end
end

option = Option.new
option.check_option(ARGV[0])