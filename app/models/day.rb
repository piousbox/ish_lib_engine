
class Day
  
  include Mongoid::Document
  
  field :date, :type => String
  validates :date, :presence => true, :uniqueness => { :scope => :user }
  
  belongs_to :user
  validates :user, :presence => true
  
  field :a1, :type => String
  field :a2, :type => String
  field :a3, :type => String
  field :a4, :type => String
  field :a5, :type => String
  
  field :work, :type => String
  field :dream, :type => String
  
end