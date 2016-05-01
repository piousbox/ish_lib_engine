
class IshLibEngine::Manager::PhotosController < Manager::ManagerController

  def without_gallery
    @photos = Photo.unscoped.where( :gallery => nil, :is_trash => false )
  end

  def destroy
    @photo = Photo.unscoped.find params[:id]
    @photo.is_trash = true
    @photo.save
    redirect_to request.referrer
  end

  def show
    @photo = Photo.unscoped.find params[:id]
  end

end

