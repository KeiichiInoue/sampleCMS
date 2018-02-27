namespace :unicorn do

  #----------------------------------------------------

  desc "Start unicorn"
  task(:start) do
    start_unicorn
  end

  desc "Stop unicorn"
  task(:stop) do
    unicorn_signal :QUIT
  end

  desc "Restart unicorn with USR2"
  task(:restart) do
    if unicorn_running?
      unicorn_signal :USR2
    else
      start_unicorn
    end
  end

  desc "Increment number of worker processes"
  task(:increment) do
    unicorn_signal :TTIN
  end

  desc "Decrement number of worker processes"
  task(:decrement) do
    unicorn_signal :TTOU
  end

  desc "Unicorn pstree (depends on pstree command)"
  task(:pstree) do
    sh "pstree '#{unicorn_pid}'"
  end

  #----------------------------------------------------

  def start_unicorn
    sh "bundle exec unicorn_rails -c #{unicorn_config} -E #{rails_env} -D"
  end

  def unicorn_signal signal
    Process.kill signal, unicorn_pid
  end

  def unicorn_pid
    begin
      File.read(pid_path).to_i
    rescue Errno::ENOENT
      raise "Unicorn doesn't seem to be running"
    end
  end

  def unicorn_running?
    File.exist? pid_path
  end

  def rails_env
    ENV["RAILS_ENV"] || "development"
  end

  def unicorn_config
    rails_root + "/config/unicorn/#{rails_env}.rb"
  end

  def rails_root
    if rails_env == 'development'
      File.expand_path("../../../", __FILE__)
    else
      '/var/www/' + app_name
    end
  end

  def pid_path
    rails_root + "/tmp/pids/unicorn.pid"
  end

  #----------------------------------------------------

  def app_name
    'sampleCMS'
  end

  #----------------------------------------------------
end
