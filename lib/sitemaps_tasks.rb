require 'rubygems'
require 'builder'

class SitemapsTasks < ActionController::Base
  
  def pretty_date args
    args.strftime('%Y-%m-%d')
  end

  def initialize args = {}
    @host = args[:domain]
    @lang = args[:lang]
    @verbose = args[:verbose]
  end

  def generate
    travel_site = Site.where( :domain => @host, :lang => @lang ).first
    travel_tag = Tag.mobi

    @reports = Report.or( :site => travel_site )

    # @galleries = Gallery.any_of( :site => travel_site, :tag => travel_tag )
    @galleries = []

    # @videos = Video.any_of( :site => travel_site, :tag => travel_tag )
    @videos = []

    # @tags = Tag.where( :site => travel_site )
    @tags = []

    @cities = City.all

    @venues = Venue.all

    # @users = User.all
    @users = []

    # @meta = [ { :url => cities_path } ]
    @meta = []

    #
    # the (builder) view
    #
    xml = Builder::XmlMarkup.new(:indent=>2)
    xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
    xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do

      @reports.each do |report|
        puts "Report: #{report.name}" if @verbose
        xml.url do
          xml.loc "http://#{@host}/#{@lang}/reports/view/#{report.name_seo}"
          xml.lastmod self.pretty_date report.created_at
        end
      end
      
      @galleries.each do |g|
        xml.url do
          xml.loc "http://#{@host}/#{@lang}/galleries/show/#{g.galleryname}"
          xml.lastmod pretty_date g.created_at
        end
      end
      
      @cities.each do |c|
        puts "City: #{c.name}" if @verbose
        xml.url do
          xml.loc "http://#{@host}/#{@lang}/cities/travel-to/#{c.cityname}"
          xml.lastmod pretty_date c.created_at
        end
      end
      
      @tags.each do |c|
        xml.url do
          xml.loc "http://#{@host}/#{@lang}/tags/show/#{c.name_seo}"
          xml.lastmod pretty_date c.created_at
        end
      end
      
      @users.each do |user|
        xml.url do
          xml.loc "http://#{@host}/#{@lang}/users/show/#{user.username}"
          xml.lastmod pretty_date user.created_at
        end
      end
      
      @venues.each do |c|
        puts "Venue: #{c.name}" if @verbose
        xml.url do
          xml.loc "http://#{@host}/#{@lang}/venues/show/#{c.name_seo}"
          xml.lastmod pretty_date c.created_at
        end
      end

      # @meta.each do |m|
      #   xml.url do
      #     xml.loc "http://#{@host}#{m[:url]}"
      #     xml.lastmod pretty_date Time.now
      #   end
      # end
      
    end

    File.open( 'sitemap.xml', 'w' ) do |f|
      f.write xml
    end
    
  end
end

