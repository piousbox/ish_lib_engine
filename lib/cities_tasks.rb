
class CitiesTasks

  # include Rails.application.routes.url_helpers
  
  def self.to_mongoid
    old_cities = SqlCity.find :all
    old_cities.each do |old|
      new = City.new
      new.name = old.name
      new.cityname = old.name_seo
      # new.descr = old.descr
      new.x = old.x
      new.y = old.y
      new.is_feature = old.is_feature
      new.created_at = old.created_at
      new.updated_at = old.updated_at
      new.save
    end
  end
  
  def self.attach_reports_to_cities
    old_cities = SqlCity.find :all
    old_cities.each do |old_city|
      old_city.reports.each do |old_report|
        new_report = Report.where( :name_seo => old_report.name_seo ).first
        if new_report.blank?
          unless Rails.env.test?
            puts "this name_seo does not exist:"
            puts old_report.name_seo
          end
        else
          new_city = City.where( :cityname => old_report.city.name_seo ).first
          new_report.city = new_city
          new_report.save
        end
      end
    end
  end

  def refresh_newsitems cityname
    do_refresh = Proc.new do |city|
      # reports
      city.reports.each do |r|
        existing_newsitem = city.newsitems.where( :name => r.name ).first
        if existing_newsitem.blank?
          n = Newsitem.new({ :name => r.name, :link_path => report_path( r, city ), :descr => r.subhead,
                             :username => (r.user || User.new).username })
          city.newsitems << n
        end
      end

      # galleries
      city.galleries.each do |g|
        begin
          image_path = g.photos[0].photo.url(:thumb)
        rescue
          image_path = nil
        end
        newsitem = city.newsitems.where( :name => g.name ).first
        if newsitem.blank?
          city.newsitems << Newsitem.new({ :name => g.name, :link_path => "http://piousbox.com/en/galleries/show/#{g.galleryname}/0", :descr => g.descr,
                                           :username => (g.user || User.new ).username, :image_path => image_path })
        else
          newsitem[:link_path] = "http://piousbox.com/en/galleries/show/#{g.galleryname}/0"
        end
      end
      
      # features
      # I omit that b/c there aren't that many, and new content will overwhelm whatever is there right now.
      #

      if city.save
        puts! "City #{city.name} saved."
      else
        puts! "There were errors with #{city.name}:"
        puts city.errors.inspect
      end
    end

    if cityname.blank?
      City.all.each do |city|
        do_refresh.call city
      end
    else
      do_refresh.call City.where( :cityname => cityname ).first
    end
  end

  def refresh_features city_name
    do_refresh = Proc.new do |city|
      puts! "City #{city.name} has #{city.features.length} features."

      city.features.each do |f|
        if !f.report.blank?
          f.name = f.report.name
          f.subhead = f.report.subhead
          f.link_path = report_path( f.report, f.report.city )
          f.save
        elsif !f.gallery.blank?
          f.name = f.gallery.name
          f.link_path = gallery_path( f.gallery )
          f.save
        else
          puts! "A feature is neither a report nor a gallery:"
          puts f.inspect
        end
      end
      if city.save
        puts! "City #{city.name} features refreshed."
      else
        puts! "There was an error:"
        puts city.errors
      end
    end
    if city_name.blank?
      City.all.each do |city|
        do_refresh.call city
      end
    else
      if City.where( :cityname => city_name ).length > 1
        puts! 'Warning: more than one city with this cityname'
      end
      do_refresh.call City.where( :cityname => city_name ).first
    end
  end    
  
  private

  def report_path( r, city )
    cityname = city.blank? ? 'undefined' : city.cityname
    "/en/cities/travel-to/#{cityname}/reports/view/#{r.name_seo}"
  end

  def gallery_path( g )
    "/en/galleries/view/#{g.galleryname}"
  end

  def puts! arg
    puts "=== === #{arg}"
  end

end
