# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "brown_lumber"
set :repo_url, "git@github.com:dustinbrownman/brown_lumber.git"

# Default branch is :master
set :branch, "release"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_via, :remote_cache
set :ssh_options, { forward_agent: true }

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml"

set(:symlinks, [
  {
    source: "/home/#{fetch(:user_environment)}/current/public",
    link: "/home/#{fetch(:user_environment)}/public"
  },
  {
    source: "/home/#{fetch(:user_environment)}/current/config.ru",
    link: "/home/#{fetch(:user_environment)}/config.ru"
  }
])

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 3

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
