class PaymentController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
  end

  def checkout
    @reservation = Reservation.find(params[:id])
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
     :amount => params[:checkout_form][:total],
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
      @reservation.paid!
      redirect_to user_reservations_path(current_user.id), :flash => { :success => "Transaction successful!" }
    else
      redirect_to user_reservations_path(current_user.id), :flash => { :error => "Transaction failed. Please try again." }
    end
  end
end
