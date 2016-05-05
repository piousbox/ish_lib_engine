

require 'reports_tasks'
require 'cities_tasks'

namespace :cities do
  
  desc 'to mongoid'
  task :to_mongoid => :environment do
    CitiesTasks.to_mongoid
  end
  
  desc 'attach reports to cities'
  task :attach_reports_to_cities => :environment do
    CitiesTasks.attach_reports_to_cities
  end

  desc 'refresh_features cityname=some_cityname -OR- cities:refresh_features (all)'
  task :refresh_features => :environment do
    CitiesTasks.new.refresh_features ENV['cityname']
  end

  desc 'refresh_newsitems cityname=cityname OR refresh_newsitems'
  task :refresh_newsitems => :environment do
    CitiesTasks.new.refresh_newsitems ENV['cityname']
  end

end

