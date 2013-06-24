# require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, 'diploma'
set :repository,  'https://github.com/antonkulikov/diploma.git'
set :branch, 'master'
set :scm, :git

set :deploy_to, "/home/anton/apps/#{application}"

set :user, 'anton'
set :use_sudo, false
set :deploy_via, :remote_cache

set :rails_env,      'production'
set :bundle_without, [:development, :test]

set :domain, 'anton@akulikov.info'
server domain, :app, :web, :db, primary: true

set :socket_file, "unix://#{shared_path}/puma.sock"

after 'deploy:restart', 'deploy:cleanup'

set :stage, 'production'
set :shared_children, shared_children << 'tmp/sockets'
 
puma_sock    = "unix://#{shared_path}/sockets/puma.sock"
puma_control = "unix://#{shared_path}/sockets/pumactl.sock"
puma_state   = "#{shared_path}/sockets/puma.state"
puma_log     = "#{shared_path}/log/puma-#{stage}.log"

after 'deploy:update_code', 'deploy:migrate'
 
namespace :deploy do
  desc "Start the application"
  task :start do
    run "cd #{current_path} && RAILS_ENV=#{stage} && bundle exec puma -d -b '#{puma_sock}' -e #{stage} -t2:4 --control '#{puma_control}' -S #{puma_state} >> #{puma_log} 2>&1 &", :pty => false
  end
 
  desc "Stop the application"
  task :stop do
    run "cd #{current_path} && RAILS_ENV=#{stage} && bundle exec pumactl -S #{puma_state} stop"
  end
 
  desc "Restart the application"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && RAILS_ENV=#{stage} && bundle exec pumactl -S #{puma_state} restart"
  end
 
  desc "Status of the application"
  task :status, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && RAILS_ENV=#{stage} && bundle exec pumactl -S #{puma_state} stats"
  end
end