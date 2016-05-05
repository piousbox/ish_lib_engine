
require 'wikitravel_tasks'

namespace :wikitravel do
  
  desc "deprecated? Usage: be rake wikitravel:random_page_to_newsitem domain='mobi.local'"
  task :random_page_to_newsitem => :environment do
    # takes too long
    WikitravelTasks.parse_list_of_pages
    
    w = WikitravelTasks.new
    w.random_page_to_newsitem({ :domain => ENV['domain'] })
  end
  
  desc "Take manually precompiled list of pages off of wikitravel.org, and create a WikitravelPage for each one that does not exist."
  task :parse_list_of_pages => :environment do
    arguments = { :filename => ENV['filename'] }
    WikitravelTasks.parse_list_of_pages arguments
  end

  desc "all pages"
  task :all_pages_to_report_and_newsitems => :environment do
    arg = { :domain => ENV['domain'], :lang => ENV['lang'] }
    w = WikitravelTasks.new arg
    w.all_pages_to_report_and_newsitems
  end

  desc "Cleanup reports"
  task :cleanup_reports => :environment do
    mobi = Site.where( :domain => 'travel-guide.mobi', :lang => 'en' ).first
    reports = Report.where( :site => mobi )
    reports.each do |r| 
      rr = WikitravelTasks.cleanup_report( r )
      puts "cleaning up #{rr.name}"
      rr.save
    end
  end

end

