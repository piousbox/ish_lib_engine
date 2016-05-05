
require 'reports_tasks'
require 'users_tasks'

namespace :users do

  desc 'import old uers from mysql with contest users onto mongodb.'
  task :import_old => :environment do
    UsersTasks.import_old
  end


end

