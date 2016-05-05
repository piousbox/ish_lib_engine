
require 'cgi'
require "open-uri"

class GalleriesTasks
  
  def self.clean_name_seo
    galleries = Gallery.find :all
    galleries.each do |g|
      Util.clean_name_seo g
    end
  end
  
  def self.to_mongoid
    logfile = 'log/galleries_tasks.log'
    
    File.open(logfile, 'a') do|f|
      
      f.puts DateTime.new
      
      user = User.where( :email => 'piousbox@gmail.com' ).first
    
      # take all photos
      old_photos = SqlPhoto.find :all,
        :conditions => { :is_trash => 0 }
      f.puts "old photos: #{old_photos.count}"
    
      old_photos.each do |old_photo|
        if 0 == Photo.where( :old_id => old_photo.id ).length
          # create new photo
          new_photo = Photo.new
          begin
            new_photo.photo = open(old_photo.photo.url(:original))
          rescue; end
          new_photo.user = user
      
          # gallery?
          unless old_photo.gallery_id.blank?
        
            old_gallery = SqlGallery.find old_photo.gallery_id
            new_gallery = Gallery.where( :galleryname => old_gallery.name_seo ).first
            if new_gallery.blank?
              # create new gallery
              new_gallery = Gallery.new
              new_gallery.name = old_gallery.name
              new_gallery.galleryname = old_gallery.name_seo
              new_gallery.descr = old_gallery.descr
              new_gallery.x = old_gallery.x
              new_gallery.y = old_gallery.y
              new_gallery.created_at = old_gallery.created_at
              new_gallery.updated_at = old_gallery.updated_at
              new_gallery.is_public = old_gallery.is_public
              new_gallery.is_feature = old_gallery.is_feature
              begin
                new_gallery.city = City.where( :cityname => old_gallery.city.name_seo ).first
              rescue; end
              new_gallery.user = user
              new_gallery.save
            
            end
          end
      
          new_photo.gallery = new_gallery
          new_photo.old_id = old_photo.id
          new_photo.created_at = old_photo.created_at
          new_photo.updated_at = old_photo.updated_at
          unless old_photo.city.blank?
            new_photo.city = City.where( :cityname => old_photo.city.name_seo ).first
          end
          new_photo.descr = "#{old_photo.name} -- "
          new_photo.descr = "#{new_photo.descr}#{old_photo.descr}"
          new_photo.is_public = old_photo.is_public
          f.puts "saving new #{new_photo.old_id}..."
          f.puts new_photo.save
          
          old_photo.is_trash = 1
          old_photo.save
      
        else
          f.puts "not updating existing photo #{old_photo.id}"
          old_photo.is_trash = 1
          old_photo.save
          
        end
      end
    end
  end
  
end


