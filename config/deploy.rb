# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :user, "dustinbrownman" # Your dreamhost account's username
set :domain, 'ps602026.dreamhost.com' # Dreamhost servername where your account is located
set :project, 'brown_lumber' # Your application as its called in the git repository
set :application, 'apps' # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}" # The standard Dreamhost setup


set :repository, "ssh://dustinbrownman@ps602026.dreamhost.com/home/dustinbrownman/repos/brown_lumber.git"

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :scm, :git
set :branch, 'release' # Or whatever branch you're on.
set :git_shallow_clone, 1
set :scm_verbose, true
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                       # Your HTTP server, Apache/etc
role :app, domain                       # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :remote_cache
set :chmod755, "app config db lib public vendor script script/* public/disp*"

set :use_sudo, false

set :normalize_asset_timestamps, false

namespace :deploy do
    namespace :assets do
      task :precompile, :roles => :web, :except => { :no_release => true } do
        from = source.next_revision(current_revision)
        if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
          run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
        else
          logger.info "Skipping asset pre-compilation because there were no asset changes"
        end
    end
  end
end

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
