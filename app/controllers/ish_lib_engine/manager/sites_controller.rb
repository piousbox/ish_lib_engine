
class IshLibEngine::Manager::SitesController < Manager::ManagerController

  PERMITTED_ATTRIBUTES = [ :domain, :lang, :title, :subhead, :homepage_layout, :layout,
                           :n_features, :n_newsitems, :is_trash, :is_ads_enabled, :is_private,
                           :home_redirect_path, :is_video_enabled, :is_resume_enabled, :is_primary
                         ]
  
  
  def index
    @sites = Site.all.order_by( :domainname => :desc, :lang => :desc )
  end

  def trash
    @sites = Site.unscoped.where( :is_trash => true ).order_by( :domainname => :desc, :lang => :desc )
    render :action => :index
  end

  def show
    @site = Site.find params[:id]
    @galleries = @site.galleries.unscoped.where({ :is_trash => false }).page( params[:galleries_page] ).per( 10 )
    @reports = @site.reports.unscoped.where({ :is_trash => false }).page( params[:reports_page] ).per( 10 )
    @videos = @site.videos.page( params[:videos_page] ).per( 5 )
    @tags = @site.tags.page( params[:tags_page] ).per( 100 )
    @features = @site.features.page( params[:features_page] ).per( 9 )
    @newsitems = @site.newsitems.page( params[:newsitems_page] ).per( 10 )
  end

  def edit
    @site = Site.find params[:id]
    authorize! :update, @site
  end
  
  def new
    authorize! :new, Site.new
    @site = Site.new
  end

  def create
    authorize! :create, Site.new
    @site = Site.new params[:site].permit( PERMITTED_ATTRIBUTES )
    if @site.save
      flash[:notice] = 'Success'
    else
      flash[:error] = 'No Luck. ' + @site.errors.inspect
    end
    redirect_to manager_sites_path
  end

  def update
    @site = Site.find params[:id]
    authorize! :update, @site
    
    if @site.update_attributes params[:site].permit( PERMITTED_ATTRIBUTES )
      flash[:notice] = 'Success'
    else
      flash[:error] = 'No Luck'
    end
    redirect_to manager_sites_path
  end

  def newsitem_delete    
    @site = Site.find params[:site_id]
    authorize! :update, @site  
    n = @site.newsitems.find( params[:newsitem_id] )
    n.delete
    @site.save
    flash[:notice] = 'Probably successfully deleted a newsitem.'
    redirect_to manager_site_path( @site.id )
  end

end
