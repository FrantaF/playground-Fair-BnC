require 'byebug'
class ListingsController < ApplicationController

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to '/'
    else
      redirect_to new_user_listing_path
    end
  end

  def destroy
    @listing = Listing.find(destroy_params[:list_id])
    @listing.destroy
    redirect_to user_path
  end

  private

  def listing_params
    params.require(:listing).permit(:name,:place_type,:property_type,:address,:description,:country,:state,:city,:guest_number,:room_number,:bed_number,:zipcode,:price, :user_id)
  end

  def destroy_params
    params.require(:listing).permit(:list_id)
  end
end
