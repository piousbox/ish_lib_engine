
FactoryGirl.define do

  #
  # right now, neither is_public nor is_trash exists in Tag
  #

  factory :tag do
    name 'Tag name'
    is_trash false
    is_public true
    after(:build) do |r|
      r.site = Site.first
    end
  end

  factory :tag1, :parent => :tag do
    name 'Tag 1'
  end

  factory :tag2, :parent => :tag do
    name 'Tag 2'
  end

  factory :tag_technology, :parent => :tag do
    name 'technology'
    name_seo 'technology'
  end
  
  factory :tag_1, :parent => :tag do
    name 'Tag-1'
  end
  factory :tag_2, :parent => :tag do
    name 'Tag-2'
  end
  factory :tag_3, :parent => :tag do
    name 'Tag-3'
  end

end


