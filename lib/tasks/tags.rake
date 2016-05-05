
require 'tags_tasks'

namespace :tags do
  
  desc " put from sql to mongoid "
  task :to_mongoid => :environment do
    TagsTasks.to_mongodb
    
  end

  desc 'name to name en'
  task :name_to_name_en => :environment do
    TagsTasks.name_to_name_en
  end
  
end
