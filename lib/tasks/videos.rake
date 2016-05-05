

require 'videos_tasks'

namespace :videos do
  
  desc "To no_video"
  task :to_no_video => :environment do
    VideosTasks.to_no_video
  end
  
  desc 'Title to name'
  task :title_to_name => :environment do
    VideosTasks.title_to_name
  end
  
end

