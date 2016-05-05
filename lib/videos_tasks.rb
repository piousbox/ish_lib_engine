

class VideosTasks
  
  
  def self.to_video
    
    videos = OldVideo.find :all,
      :include => [ :user, :city ]
    
   
    videos.each do |v|
      
      no = Video.new
      
      # so far names are non-nil
      no.name = v[:name]
      no.seo = v[:name].to_simple_string
      
      no.descr = v[:descr]
      
      no.youtube_url = v[:youtube_url]
      no.w = v[:w]
      no.h = v[:h]
      
      no.created_at = v[:created_at]
      no.updated_at = v[:updated_at]
      
      no.is_public = v[:is_public]
      no.is_feature = v[:is_feature]
      no.is_trash = v[:is_trash]
      
      no.x = v[:x]
      no.y = v[:y]
      
      no_user = NoUser.where( :email => v.user[:email] ).first
      if no_user.blank?
        no_user = NoUser.new
        no_user.email = v.user[:email]
        no_user.save
      end
      no.no_user = no_user
      
      no_city = NoCity.where( :name => v.city.name ).first
      if no_city.blank?
        no_city = NoCity.new
        no_city.name = v.city.name
        no_city.save 
      end
      no.no_city = no_city
      
      no.save
    end
    
  end
  
  def self.title_to_name
    
    videos = Video.all
    
    videos.each do |v|
      v.name = v.title
      if v.save
        puts '+'
      end
      
    end
    
  end
  
end