
url_1 = 'https://s3.amazonaws.com/ISh-trashy/photos/thumb/52587525b6c0d0a0f0000027/vec.jpg'

FactoryGirl.define do
  
  factory :photo do
    name 'blah blah'
    is_public 1
    is_trash 0
    # photo File.open('spec/data/photo_1.jpg')
    photo File.open('spec/data/photo_2.gif')
    user User.all.first
  end

  factory :photo_without_name, :parent => :photo do
    name ''
  end


end
