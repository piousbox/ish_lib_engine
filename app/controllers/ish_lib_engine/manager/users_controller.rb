
class IshLibEngine::Manager::UsersController < Manager::ManagerController

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

end

