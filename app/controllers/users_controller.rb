
class UsersController < Clearance::UsersController
  def index
    @listings = Listing.order(:updated_at).page params[:page]
    @user = User.new
    # @listpage = Listing.order(:update_at).page params[:page]
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/'
  end


private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :birthdate)
  end
end
