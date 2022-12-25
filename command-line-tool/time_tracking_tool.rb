class TrackTime
#   attr_accessor :task_name, :start_time, :ending_time, :actual_time

#   def initialize(task_name, start_time, ending_time: "", actual_time: "")
#     @task_name = task_name
#     @start_time = start_time
#   end

  def record_start_time
    # ファイル名をbootcampの中から取ってくる


    # タスクの開始　＝　ファイル名が作成された時
  end

  def record_end_time
    # ファイル名をbootcampの中から取ってくる

    # タスクの開始　＝　ファイル名が作成された時
  end

  # ファイルの情報を表示
  def show_file_info(path)
    file_status = File::Stat.new(path)
    begin
      puts "birthtime: #{file_status.birthtime} (ファイル作成日時)"
    rescue NotImplementedError => e
      puts e.inspect
    end
    puts "modify time: #{file_status.mtime} (最終更新日時 modify time)"
    puts "change time: #{file_status.ctime} (最終状態変更日時 change time)"
    puts "access time: #{file_status.atime} (最終アクセス日時 access time)"
  end
   
end





















class Option
  def check_option(option_kind)
    case option_kind
      when "-s", "--start"
        record_start_time
      when "-f", "--finish"
        record_ending_time
      when "-vt", "--view-total"
        show_todays_task
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
    # Taskクラスからインスタンスを作成して、配列に追加する処理を記述
    track_time = TrackTime.new
    track_time.show_file_info(ARGV[1])
  end

  def record_end_time
    # Taskインスタンスの ending_time に終了時刻を記録させる処理を記述
    # そのタスクの実績時間も計算して、actual_time に記録させる処理を記述
  end

  def show_todays_tasks
    # タスクを格納している配列から、インスタンスを取り出し、本日のタスクを表示させる処理を記述
    # 同時に、作業時間を合計する処理を記述し、ループ処理を抜けた後、表示させる処理を記述
  end

  def show_week_tasks
    # 直近7日間の日別作業時間を表示させる処理を記述
    # Time クラスで、直近7日間を取得
  end
end

option = Option.new
option.check_option(ARGV[0])


