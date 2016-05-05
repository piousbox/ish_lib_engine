
FactoryGirl.define do  

  factory :city, :class => City do
    name 'city name'
    name_en 'city name'
    name_pt 'city name'
    name_ru 'city name'
    cityname 'city_name'
    is_feature false
    x '1'
    y '1'
    
  end
  
  factory :sf, :class => City do
    cityname 'San_Francisco'
    name 'San Francisco'
    name_en 'San Francisco'
    name_pt 'San Francisco' 
    name_ru 'San Francisco'
    is_feature false
    x '1'
    y '1'
    
  end

  factory :nyc, :class => City do
    cityname 'New_York_City'
    name 'New York City'
    name_en 'NYC'
    name_pt 'NYC'
    name_ru 'NYC'
    is_feature false
    x '1'
    y '1'

  end
  
  factory :rio, :class => City do
    name 'Rio Name'
    cityname 'rio'
    name_en 'rio'
    name_pt 'rio'
    name_ru 'rio'
    is_feature false
    calendar_frame 'calendar'
    x '1.5'
    y '1.5'
    
  end

  factory :chicago, :class => City do
    name 'Chicago'
    name_pt 'chicago' 
    name_en 'chicago'
    name_ru 'chicago'
    cityname 'chicago'
    is_feature true
    calendar_frame 'calendar frame'
    x '1.4'
    y '1.1'
  end

  factory :city_cccq, :class => City do
    name 'cccq'
    name_en 'cccp'
    name_ru 'cccp'
    name_pt 'cccp'
    cityname 'cccq'
    x '1.0'
    y '1.2'
    is_feature false
    after :build do |city|
      city.galleries << Gallery.all[0]
      city.reports << Report.all[0]
    end
  end

  factory :maputo, :class => City do
    name 'Maputo'
    name_en 'maputo'
    name_ru 'maputo'
    name_pt 'maputo'
    cityname 'Maputo'
    is_feature true
  end

end
