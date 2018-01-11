
class UsersController < Clearance::UsersController
  before_action :find_user, only:[:update, :show]

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
    @user_listing = Listing.where(user_id: @user.id).page params[:page]
    # @user_listing.order(:updated_at).page params[:page]
  end

  def index
    @users = User.order(:updated_at).page params[:page]
  end

  def update
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :birthdate, :password, :phone, :country, :gender, :avatar)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
