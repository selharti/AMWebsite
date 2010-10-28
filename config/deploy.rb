set :application, "amwebsite"



set :scm, :git
set :local_scm_command, "C:/Dev/GitHub/PortableGit-1.7.1-preview20100612/bin/git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :repository,  "git://github.com/selharti/AMWebsite.git"
set :branch , "master"

set :user, "agilemaroc"
set :use_sudo, false
set :domain, "host3.cekoya.ca"
server domain, :app, :web
role :db, domain, :primary => true


set :deploy_to, "/var/www/apps/agilemaroc"

default_run_options[:pty] = true
#ssh_options[:forward_agent] = true
#ssh_options[:keys] = %w{c:/Dev/GitHub/PortableGit-1.7.1-preview20100612/.ssh/id_rsa}

set :scm_passphrase, "selharti2008"

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :rails_env, "production"
# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

task :after_update_code do
  run "ln -s #{deploy_to}/#{shared_dir}/config/database.yml #{current_release}/config/database.yml"
end
