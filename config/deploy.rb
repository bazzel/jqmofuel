# RVM bootstrap
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'

# See https://github.com/javan/whenever
set :whenever_command, "bundle exec whenever"
require 'whenever/capistrano'

set :rvm_ruby_string, '1.9.2-p136'
set :rvm_type, :user

# bundler bootstrap
require 'bundler/capistrano'

# main details
set :application, "e-fueling"
role :web, "patrick.kabisa.nl"
role :app, "patrick.kabisa.nl"
role :db,  "patrick.kabisa.nl", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/var/www/e-fueling"
set :deploy_via, :remote_cache
set :user, "passenger"
set :use_sudo, false

# repo details
set :scm, :git
set :scm_username, "passenger"
set :repository, "git@github.com:bazzel/jqmofuel.git"
set :branch, "master"
set :git_enable_submodules, 1

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'

# We don't want the clear_crontab task to be called, 'cause this will raise an error
# (Could not find aaronh-chronic-0.3.9 in any of the sources) and rollback deployment.
# Overriding it will solve this.
namespace :whenever do
  desc "Clear application's crontab entries using Whenever"
  task :clear_crontab, :roles => whenever_roles do
    # Override whenever's clear_crontab
  end
end