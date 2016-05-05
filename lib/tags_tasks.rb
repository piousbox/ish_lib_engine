
require 'cgi'

class TagsTasks
  
  def self.to_mongodb
    
    # get all tags
    old_tags = Tag.find :all
    
    # put them in mongoid
    old_tags.each do |old|
      new = NoTag.new
      
      new.name = old.name
      new.name_seo = old.name_seo
      # new.subhead = old.subhead
      new.descr = old.descr
      
      new.domain = 'sedux.local'
      
      new.created_at = old.created_at
      new.updated_at = old.updated_at
      
      new.is_public = 1
      new.is_feature = 0
      new.is_trash = 0
      
      new.lang = 'en'
     
      new.save
      
    end
    
  end

  def self.name_to_name_en
    Tag.all.each do |tag|
      tag.name_en = tag.name
      if '' == tag.name_pt
        tag.name_pt = tag.name_en
      end
      if '' == tag.name_ru
        tag.name_ru = tag.name_en
      end
      flag = tag.save
      if flag
        puts '+'
      else
        puts tag.errors.inspect
      end
    end
  end

end



#class NoTag
#  
#  include Mongoid::Document
#  
#  field :name, :type => String
#  field :name_seo, :type => String
#  field :subhead, :type => String
#  field :descr, :type => String
#  field :domain, :type => String
#  
#  has_many :reports
#  accepts_nested_attributes_for :reports, :allow_destroy => false
#  
#  has_many :galleries
#  accepts_nested_attributes_for :galleries, :allow_destroy => false
#  
#  belongs_to :parent_tag, :class_name => 'Tag', :inverse_of => :children_tags
#  has_many :children_tags, :class_name => 'Tag', :inverse_of => :parent_tag
#  accepts_nested_attributes_for :children_tags, :allow_destroy => false
#  accepts_nested_attributes_for :parent_tag, :allow_destroy => false
#  
#  field :created_at, :type => DateTime
#  field :updated_at, :type => DateTime
#  
#  field :is_public, :type => Boolean
#  field :is_feature, :type => Boolean
#  field :is_trash, :type => Boolean
#  
#end
#
#create_table "tags", :force => true do |t|
#    t.string    "name",        :limit => 200,                    :null => false
#    t.string    "name_seo",    :limit => 600,                    :null => false
#    t.text      "descr"
#    t.integer   "parent_id",                  :default => 1
#    t.integer   "user_id",                    :default => 0,     :null => false
#    t.timestamp "created_at",                                    :null => false
#    t.timestamp "updated_at",                                    :null => false
#    t.integer   "is_public",                  :default => 1,     :null => false
#    t.boolean   "is_feature",                 :default => false, :null => false
#    t.boolean   "is_trash",                   :default => false, :null => false
#    t.string    "name_pt"
#    t.string    "descr_pt"
#    t.integer   "language_id"
#    t.string    "lang",                       :default => "en"
#  end