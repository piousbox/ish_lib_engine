
require 'sites_tasks'

namespace :sites do
  
  desc 'refreshes the denormalized numbers of reports and galleries in all sites.'
  task :n_reports_galleries => :environment do
    SitesTasks.n_reports_galleries
  end

end

