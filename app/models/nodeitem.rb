
class Nodeitem

  include Mongoid::Document
  include Mongoid::Timestamps

  field :repository, :type => String
  validates :repository, :presence => true

  field :branch, :type => String
  validates :branch, :presence => true

  field :subdomain, :type => String
  validates :subdomain, :presence => true, :uniqueness => true

  field :status, :type => String

end
