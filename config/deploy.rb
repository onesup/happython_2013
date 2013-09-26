require "bundler/capistrano"

set :rails_env, "production" #added for delayed job
set :application, "kfarm"
set :user, "daul"
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :copy
set :use_sudo, false
set :scm, "git"
set :repository, "git@bitbucket.org:#{application}/#{application}.git"
set :branch, "master"
set :default_environment, {
      'PATH' => "/home/daul/.rbenv/versions/2.0.0-p0/bin/:$PATH"
    }
set :keep_releases, 5
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
server "14.63.162.188", :web, :app, :db, primary: true
after "deploy", "deploy:cleanup" # keep only the last 5 releases

# for delayed_job
#after "deploy:stop", "delayed_job:stop"
#after "deploy:start", "delayed_job:start"
#after "deploy:restart", "delayed_job:restart"

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
  end
  after "deploy:setup", "deploy:setup_config"

  task :upload_facebook_parameters do
    origin_file = "config/facebook.yml"
    destination_file = shared_path + "/config/facebook.yml" # Notice the
    shared_path

    try_sudo "mkdir -p #{File.dirname(destination_file)}"
    top.upload(origin_file, destination_file)
  end
  
  task :upload_email_parameters do
    origin_file = "config/email.yml"
    destination_file = shared_path + "/config/email.yml" # Notice the
    shared_path

    try_sudo "mkdir -p #{File.dirname(destination_file)}"
    top.upload(origin_file, destination_file)
  end
  after "deploy:setup", "deploy:upload_facebook_parameters"
  after "deploy:setup", "deploy:upload_email_parameters"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; RAILS_ENV=#{rails_env}; rake db:seed RAILS_ENV=#{rails_env}"
  end
  
  desc "Make symlink for custom config yaml"
  task :create_symlink do
    run "ln -nfs #{shared_path}/config/facebook.yml #{latest_release}/config/facebook.yml"
    run "ln -nfs #{shared_path}/config/email.yml #{latest_release}/config/email.yml"
  end
  after "deploy:finalize_update", "deploy:create_symlink"
  
  before "deploy", "deploy:check_revision"
end


