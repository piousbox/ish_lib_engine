require 'sitemaps_tasks'

namespace :sitemaps do
  
  desc 'generate'
  task :generate => :environment do
    s = SitemapsTasks.new( :lang => ENV['lang'], :domain => ENV['domain'], :verbose => ENV['verbose'] )
    s.generate
  end

end

