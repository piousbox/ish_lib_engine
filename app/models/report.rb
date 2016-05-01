class Report   
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  validates :name, :presence => true
  index({ :name => 1 }, { :unique => true })
  index({ :name => 1, :is_trash => 1 })

  field :name_seo, :type => String
  validates :name_seo, :uniqueness => true, :presence => true
  index({ :name_seo => 1 }, { :unique => true })

  field :descr, :type => String 

  field :is_trash, :type => Boolean, :default => false
  index :is_trash => 1, :is_public => 1 

  field :is_public, :type => Boolean, :default => true
  index({ :is_public => 1 })
  scope :public, ->{
    where({ is_public: true })
  }

  field :is_feature, :type => Boolean, :default => false
  index({ :is_feature => 1 })

  field :is_done, :type => Boolean, :default => true
  index({ :is_done => 1 })
  
  field :x, :type => Float
  field :y, :type => Float

  field :lang, :type => String, :default => 'en'
  index({ :lang => 1 })
   
  field :username, :type => String, :default => 'anonymous'
  validates :username, :presence => true, :allow_nil => false
  belongs_to :user
  validates :user, :presence => true, :allow_nil => false
  index({ :username => 1 })

  field :subhead, :type => String
  
  belongs_to :tag
  belongs_to :city
  
  belongs_to :site
  validates :site, :presence => true
  
  has_and_belongs_to_many :venues
  belongs_to :cities_user
  
  has_one :photo

  field :n_upvotes, :default => 0
  field :n_spamvotes, :default => 0

  default_scope ->{
    where({ is_public: true, is_trash: false }).order_by({ created_at: :desc })
  }
  
  def self.list conditions = { :is_trash => false }
    out = self.where( conditions ).order_by( :name => :asc ).limit( 100 )
    [['', nil]] + out.map { |item| [ item.name, item.id ] }
  end
  
  PER_PAGE = 20  
  def self.paginates_per
    self::PER_PAGE
  end

  def venue
    return self.venues[0] || nil
  end
  
  def self.all
    self.where( :is_public => true, :is_trash => false ).order_by( :created_at => :desc )
  end
  
  def self.not_tagged
    Report.where( :tag_id => nil, :city => nil )
  end
  
  def self.for_homepage args
    begin
      tag_ids = args[:main_tag].children_tags.map { |tag| tag._id } + [ args[:main_tag]._id ]
      return Report.where( :tag_id.in => tag_ids ).page args[:page]
    rescue
      return Report.page args[:page]  
    end
  end

  set_callback :create, :after do |doc|
    if doc.is_public

      if !doc.venue_ids.blank?
        ( doc.venue_ids || [] ).each do |venue_id|
          v = Venue.find venue_id
          u = User.find doc.user_id
          n = Newsitem.new
          n.username = u.username unless u.blank?
          n.report = doc
          v.newsitems << n
          v.save
        end
      end 

      #
      # hidden
      proc do # nothing
      unless doc.site.blank?
        username = doc.user.username || 'anonymous'
        doc.site.newsitems << Newsitem.new({ :report_id => doc.id, :username => username, :descr => doc.subhead, :name => doc.name })
        flag = doc.site.save
        puts! flag unless flag
      end
      end

      unless doc.city.blank?
        city = City.find doc.city.id
        username = doc.user.username || 'anon'
        n = Newsitem.new :report => doc, :username => username
        city.newsitems << n
        city.save
      end
    end
  end
  
  def self.clear
    if Rails.env.test?
      self.unscoped.each { |r| r.remove }
    end
  end

  def self.not_tagged
    Report.where( :tag_id => nil, :city => nil )
  end

  def venue
    self.venues[0] || nil
  end

end
