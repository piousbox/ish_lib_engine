
FactoryGirl.define do

  factory :site do
    domain 'piousbox.com'
    lang 'en'
  end

  factory :site_ru, :class => Site do
    domain 'piousbox.com'
    lang 'ru'
  end

  factory :site_pt, :class => Site do
    domain 'piousbox.com'
    lang 'pt'
  end

  factory :site_wdz, :class => Site do
    domain 'webdevzine.com'
    lang 'en'
  end

end

 
