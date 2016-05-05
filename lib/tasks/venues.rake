

require 'venues_tasks'

namespace :venues do
  desc "Generate name_seo"
  task :generate_name_seo => :environment do
    
    VenueTasks.generate_name_seo
    
  end
end

