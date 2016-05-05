
class FeaturesTasks

  def self.titleize
    # all sites
    Site.all.each do |site|
      site.features.all.each_with_index do |feature, idx|
        new = feature.name.titleize
        if new != feature.name
          f = site.features.find(feature.id)
          f.update_attributes :name => new
        end
      end
    end
  end
  
end
