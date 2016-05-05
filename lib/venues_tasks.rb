

class VenuesTasks
  
  
  def self.generate_name_seo
    venues = Venue.find :all,
      :conditions => { :name_seo => nil }
    
    venues.each do |venue|
      venue[:name_seo] = venue[:name].downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      venue.save
    end
  end
end