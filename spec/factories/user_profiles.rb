
FactoryGirl.define do
  
  
  factory :pi_pt, :class => UserProfile do
    
    lang 'pt'
    after :create do |p|
      p.user User.where( :username => 'piousbox' ).first
    end
    
  end
  
  factory :pi_en, :class => UserProfile do
    lang 'en'
    education 'pi_en Education'
    
    after :create do |p|
      p.user User.where( :username => 'piousbox' ).first
    end
    
  end
  
  factory :pi_ru, :class => UserProfile do
    
    lang 'ru'
    after :create do |p|
      p.user User.where( :username => 'piousbox' ).first
    end
    
  end
  
end