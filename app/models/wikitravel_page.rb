class WikitravelPage
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  validates :title, :presence => true, :uniqueness => true

  field :url, :type => String
  validates :url, :presence => true, :uniqueness => true
  
  def self.clear
    if Rails.env.test?
      self.each { |r| r.remove }
    end
  end

  DOMAIN = 'http://wikitravel.org'

end
