load 'deploy'

set :application, "papers"
set :repository, 'file://.'
set :deploy_via, :copy
set :copy_strategy, :export
set :copy_exclude, '.git/*'
set :scm, :git
set :use_sudo, false

PAPERS_ENV = ENV['PAPERS_ENV'] || 'staging'
load 'conf/deploy.' + PAPERS_ENV

namespace :deploy do
  task :finalize_update do
    run "ln -s #{deploy_to}/shared/conf/* #{latest_release}/conf"
    run "ln -s #{deploy_to}/shared/ext/{adodb,smarty} #{latest_release}/ext"
    run "cd #{latest_release} && make runtime"
    run "test -f #{deploy_to}/shared/admin/.htpasswd && cp /#{deploy_to}/shared/admin/.htpasswd #{latest_release}/admin/ || true"
    run "test -f #{deploy_to}/shared/admin/.htaccess && cp /#{deploy_to}/shared/admin/.htaccess #{latest_release}/admin/ || true"
    run "cd #{latest_release} && ./script/migratedb"
  end
end

namespace :papers do
  task :setup do

    # upload configuration files
    run "mkdir -p #{deploy_to}/shared/conf"
    Dir.glob('conf/*.conf.php').each do |file|
      upload(file, "#{deploy_to}/shared/conf/#{File.basename(file)}")
    end

    # download PHP dependencies on the server
    run "mkdir -p #{deploy_to}/shared/ext"
    upload('ext/Makefile', "#{deploy_to}/shared/ext/Makefile")
    run "cd #{deploy_to}/shared/ext && make"

    run "mkdir -p #{deploy_to}/shared/admin"

    # TODO create upload directory
  end
end
after('deploy:setup', 'papers:setup')

# vim: ft=ruby
