require 'reports_tasks'

namespace :reports do
  
  desc 'attached_photos_to_mongoid'
  task :attached_photos_to_mongoid => :environment do
    ReportsTasks.attached_photos_to_mongoid
  end
  
  desc "migrate some features to mongoid"
  task :some_features => :environment do
    ReportsTasks.some_features
    
  end
  
  desc 'to mongoid'
  task :to_mongoid => :environment do
    ReportsTasks.to_mongoid
  end

  desc 'parse one reuters article'
  task :parse_reuters_technology_rss => :environment do
    ReportsTasks.parse_reuters_technology_rss
  end

  desc 'empty trash'
  task :empty_trash => :environment do
    ReportsTasks.empty_trash
  end
  
  desc 'titleize'
  task :titleize => :environment do
    ;
  end

end

