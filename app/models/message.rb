

class Message
  
  include Mongoid::Document
  
  field :from_email, :type => String
  field :name, :type => String
  field :subject, :type => String
  field :body, :type => String
  
  field :to_email, :type => String
  
end