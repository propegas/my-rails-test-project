default_run_options[:pty] = true
	set :repository,  "git://github.com/mzslater/learning-rails-sample-app.git"
	set :scm, "git"
	set :branch, "master"
	set :deploy_via, :remote_cache

  set :application, "mytest2"
  	set :deploy_to, "/usr/local/www/apache22/data/#{application}"
  	set :user, "pegas"
  	set :admin_runner, "pegas"

set :rake, "/usr/local/ruby-enterprise/bin/rake"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "213.85.145.134"
	role :web, "213.85.145.134"
	role :db,  "213.85.145.134", :primary => true
	
	namespace :deploy do
  	  desc "Restart Application"
  	  task :restart, :roles => :app do
  	    run "touch #{current_path}/tmp/restart.txt"
  	  end
  	  desc "Start Application -- not needed for Passenger"
  	  task :start, :roles => :app do
  	    # nothing -- need to override default cap start task when using Passenger
  	  end
  	end