require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

set :rails_env,   'production'
set :user,        'maxpoint'

task :staging do
  set :domain,        '64.20.228.118'
end

task :production do
  set :domain,        '64.20.228.121'
end

# Common between beta and production
set :port,          '2020'
set :deploy_to,     lambda {"/home/#{user}/app"}
set :repository,    'git@github.com:vasaristudio/maxpoint.git'
set :branch,        'master'
set :forward_agent, true

set :shared_paths, ['config/database.yml', 'log', 'tmp', 'public/system']

task :environment do
  invoke :'rbenv:load'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/tmp"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp"]

  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[mkdir -p "#{deploy_to}/shared/public/system"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/public/system"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    to :launch do
      invoke :'unicorn:restart'
    end
  end
end

desc "Shows logs."
task :logs do
  queue %[cd #{deploy_to!} && tail -200f shared/log/#{rails_env}.log]
end

namespace :unicorn do
  set :unicorn_pid, lambda { "#{deploy_to}/shared/tmp/pids/unicorn.pid" }
  set :unicorn_pid, lambda { "#{deploy_to}/shared/tmp/pids/unicorn.pid" }
  set :start_unicorn, lambda {%{
    cd #{deploy_to}/current
    mkdir -p "#{deploy_to}/shared/tmp/pids"
    bundle exec unicorn -c #{deploy_to}/current/config/unicorn/#{rails_env}.rb -E #{rails_env} -D
  } }

  desc "Start unicorn"
  task :start => :environment do
    queue 'echo "-----> Start Unicorn"'
    queue! start_unicorn
  end

  desc "Stop unicorn"
  task :stop do
    queue 'echo "-----> Stop Unicorn"'
    queue! %{
      test -s "#{unicorn_pid}" && kill -QUIT `cat "#{unicorn_pid}"` && echo "Stop Ok" && exit 0
      echo >&2 "Not running"
    }
  end

  desc "Restart unicorn using 'upgrade'"
  task :restart => :environment do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end
