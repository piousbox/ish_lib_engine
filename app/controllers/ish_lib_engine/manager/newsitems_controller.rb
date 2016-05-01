
class IshLibEngine::Manager::NewsitemsController < Manager::ManagerController

  def new
    authorize! :new, ManagerNewsitem.new

    @newsitem = Newsitem.new
    @city = City.find params[:city_id]

  end

  def create
    authorize! :create, ManagerNewsitem.new

    n = Newsitem.new params[:newsitem]
    n.report = Report.find params[:newsitem][:report_id] unless params[:newsitem][:report_id].blank?
    n.gallery = Gallery.find params[:newsitem][:gallery_id] unless params[:newsitem][:gallery_id].blank?
    n.photo = Photo.find params[:newsitem][:photo_id] unless params[:newsitem][:photo_id].blank?
    n.descr = params[:newsitem][:descr]

    @city = City.find params[:city_id]
    @city.newsitems << n

    if @city.save
      flash[:notice] = 'Success'
      redirect_to edit_manager_city_path( @city.id )
    else
      flash[:error] = 'No Luck. ' + @city.errors.inspect
      render :action => :new_newsitem

    end
  end
  
  def show
  end

  def index
  end

  def destroy
  end

  def update
  end
  
end

