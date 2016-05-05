
FactoryGirl.define do    

  factory :gallery, :class => Gallery do
    name 'g name'
    galleryname 'g_name'
    is_feature false
    is_public true
    is_trash false
    username 'username'
    after(:build) do |r|
      r.user = User.first
      r.site = Site.first
      r.save
    end
  end

  factory :pi_gallery, :class => Gallery do
    name 'g name'
    galleryname 'g_name'
    is_feature false
    is_public true
    is_trash false
    username 'username'
    after(:build) do |r|
      r.user = User.first
      r.site = Site.first
      r.save
    end
  end
  
  factory :g1, :class => Gallery do
    name 'g name11'
    galleryname 'g_name11'
    is_feature false
    is_public true
    is_trash false
    username 'username'
    created_at '2012-01-01'
    after(:build) do |r|
      r.user = User.first
      r.site = Site.first      
      r.save
    end
  end
  
  factory :g2, :class => Gallery do
    name 'g name1234'
    galleryname 'g_name4s2'
    is_feature false
    is_public true
    is_trash false
    username 'username'
    created_at '2012-02-01'
    after(:build) do |r|
      r.user = User.first
      r.site = Site.first
      r.save
    end
  end
  
  factory :g3, :class => Gallery do
    name 'blah blah 2'
    user User.all[0]
    galleryname 'a2'
    descr 'blah blah'
    is_feature false
    is_public true
    is_trash false
    username 'username'
    created_at '2012-01-02'
    after(:build) do |r|
      r.user = User.first
      r.site = Site.first
      r.save
    end
  end

  factory :g4, :class => Gallery do
    name 'blah blah 23'
    user User.all[0]
    galleryname 'a3'
    descr 'blah blah'
    is_feature false
    is_public true
    is_trash false
    username 'username'
    after(:build) do |r|
      r.user = User.first
      r.site = Site.first
      r.save
    end
  end

  factory :g5, :class => Gallery do
    name 'blah blah 24'
    user User.all[0]
    galleryname 'a4'
    descr 'blah blah'
    is_feature false
    is_public true
    is_trash false
    username 'username'
    after(:build) do |r|
      r.user = User.first
      r.site = Site.first
      r.save
    end
  end

  factory :gallery_anonymous, :parent => :g5 do
    name 'anonymous gallery'
    is_anonymous true
  end

  factory :private_gallery, :class => Gallery do
    name 'g name private'
    galleryname 'g_name_private'
    is_feature false
    is_public false
    is_trash false
    username 'username'
    after(:build) do |r|
      r.user = User.first
      r.site = Site.first
      r.save
    end
  end
  
end



