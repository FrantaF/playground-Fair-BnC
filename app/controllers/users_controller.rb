
class UsersController < Clearance::UsersController
  def home
    @listings = Listing.order(updated_at: :desc).page params[:page]
    # @listpage = Listing.order(:update_at).page params[:page]
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/'
  end

  def show
    @user = User.find(params[:id])
    @user_listing = Listing.where(user_id: @user.id).page params[:page]
    # @user_listing.order(:updated_at).page params[:page]
  end

  def index
    @users = User.order(:updated_at).page params[:page]
  end

  def update
    @update = User.find(params[:id])
    @update.update(update_params)
    redirect_to '/'
  end



private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :birthdate)
  end

  def update_params
    params.require(:user).permit(:first_name,:last_name,:email,:birthdate,:country,:phone,:gender)
  end
end
