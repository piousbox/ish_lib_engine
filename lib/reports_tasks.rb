
require 'rubygems'
require 'simple-rss'
require 'open-uri'
require 'htmlentities'
require 'string'

class ReportsTasks

  def self.parse_reuters_technology_rss domain = 'piousbox.com'
    site = Site.where( :lang => 'en', :domain => domain ).first
    return false if site.blank?    
    
    feed_addr = 'http://feeds.reuters.com/reuters/technologyNews'
    rss = SimpleRSS.parse open(feed_addr)
    # puts! rss.channel.title
    # puts! rss.channel.link
    item = rss.items.first

    r = Report.new :name => item.title, :name_seo => item.title.to_simple_string
    r.descr = HTMLEntities.new.decode( item.description ) + "<br />\nRead full article at <a href=\"#{item.link}\">#{item.link}</a>"
    # r.tag = Tag.where( :name_seo => 'technology' ).first
    r.user = User.where( :username => 'anon' ).first
    flag = r.save
    if flag
      # puts "Saved report #{r.name}" unless Rails.env.test

      # for homepage
      n = Newsitem.new
      n.report = r
      
      site.newsitems << n
      site.save
      
    else
      puts!(r.errors.messages)
    end
  end

  def self.empty_trash
    rs = Report.where( :is_trash => true)
    rs.each do |r|
      puts "Removed #{r.name}"
      r.remove
    end
  end

end

def puts! args
  puts '+++ +++'
  puts args.inspect
end
