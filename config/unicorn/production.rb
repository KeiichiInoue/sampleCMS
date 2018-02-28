#----------------------------------------------------

rails_root = File.expand_path("../../..", __FILE__)
current_path = "/var/www/sampleCMS/"

#----------------------------------------------------

worker_processes 4
timeout 300

working_directory "#{rails_root}"
listen File.expand_path('tmp/sockets/unicorn.sock', rails_root)
pid File.expand_path('tmp/pids/unicorn.pid', rails_root)

stdout_path File.expand_path('log/unicorn.stdout.log', rails_root)
stderr_path File.expand_path('log/unicorn.stderr.log', rails_root)

#----------------------------------------------------

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

#----------------------------------------------------

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{current_path}/Gemfile"
end

#----------------------------------------------------

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
    if old_pid != server.pid
      begin
        sig = (worker.nr + 1) >= server.worker_processes ?  :QUIT : :TTOU
        Process.kill(sig, File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
      end
    end
    sleep 1
  end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

#----------------------------------------------------