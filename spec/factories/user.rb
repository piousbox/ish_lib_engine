
FactoryGirl.define do
  
  factory :user do
    email 'user@user.com'
    username 'user'
    name 'user'
    group_id 3
    password 's3cret123'
    encrypted_password '$2a$10$PoBe1MvkoGJsjMVTEjKqgeBUp.xdfzWoiDjBzQhtLAj16NqIa2fOy'
  end

  factory :anon, :class => User do
    email 'anon@gmail.com'
    username 'anon'
    name 'Anonymous'
    group_id 3
    password 's3cret123'
    encrypted_password '$2a$10$PoBe1MvkoGJsjMVTEjKqgeBUp.xdfzWoiDjBzQhtLAj16NqIa2fOy'
  end

  factory :user_2, :class => User do
    email 'user_2@user.com'
    username 'user_2'
    name 'user_2'
    group_id 3
    password 's3cret123'
    encrypted_password '$2a$10$PoBe1MvkoGJsjMVTEjKqgeBUp.xdfzWoiDjBzQhtLAj16NqIa2fOy'
  end

  factory :piousbox, :class => User do
    email 'piousbox@gmail.com'
    username 'piousbox'
    name 'simple'

    group_id 3
    password 's3cret123'
    encrypted_password '$2a$10$PoBe1MvkoGJsjMVTEjKqgeBUp.xdfzWoiDjBzQhtLAj16NqIa2fOy'
    
  end
  
  factory :admin, :class => User do
    email 'admin@gmail.com'
    username 'admin'
    name 'simple'

    group_id 1
    password 's3cret123'
    encrypted_password '$2a$10$PoBe1MvkoGJsjMVTEjKqgeBUp.xdfzWoiDjBzQhtLAj16NqIa2fOy'
    
  end

  factory :simple, :class => User do
    email 'simple@gmail.com'
    username 'simple'
    name 'simple'

    group_id 3
    password 's3cret123'
    encrypted_password '$2a$10$PoBe1MvkoGJsjMVTEjKqgeBUp.xdfzWoiDjBzQhtLAj16NqIa2fOy'

  end

  factory :manager, :class => User do
    email 'manager@gmail.com'
    username 'manager'
    name 'simple'
    
    group_id 2
    password 's3cret123'
    encrypted_password '$2a$10$PoBe1MvkoGJsjMVTEjKqgeBUp.xdfzWoiDjBzQhtLAj16NqIa2fOy'

  end

  factory :feature_user, :class => User do
    email 'feature_user@gmail.com'
    username 'feature_user'
    name 'Featured'
    is_feature true

    group_id 3
    password 's3cret123'
    encrypted_password '$2a$10$PoBe1MvkoGJsjMVTEjKqgeBUp.xdfzWoiDjBzQhtLAj16NqIa2fOy'

  end
  
end
