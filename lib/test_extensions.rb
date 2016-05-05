



def create_users
  User.all.each { |u| u.remove }
  FactoryGirl.create :user
  FactoryGirl.create :piousbox
end