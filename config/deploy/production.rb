set :rails_env, :production

#set :branch, 'release/1.0'
set :branch, 'master'

role :web, "..."
role :app, "..."

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, "config/unicorn/production.rb"
set :unicorn_rack_env, 'production'
