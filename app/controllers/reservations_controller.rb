class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      # redirect_to user_path(@reservation.user_id)
      PostmanWorker.perform_later(current_user.id, params[:listing_id], @reservation.id)
      redirect_to user_reservations_path(current_user.id)
    else
      @listing = Listing.find(@reservation.listing_id)
      @errors = @reservation.errors.full_messages
      render 'listings/show'
      # redirect_to user_listing_path(@reservation.user_id, @reservation.listing_id)
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_reservations_path
  end

  def index
    if !current_user
      redirect_to '/'
    else
    @user = current_user
    @reservations = @user.reservations.order(updated_at: :desc)
    end
  end

private

  def reservation_params
  params.require(:reservation).permit(:user_id, :listing_id, :num_guests, :start_date, :end_date)
  end

end
