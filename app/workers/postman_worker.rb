class PostmanWorker < ActiveJob::Base
  queue_as :default

  def perform(user_id, listing_id, reservation_id)
    user = User.find(user_id)
    listing = Listing.find(listing_id)
    reservation = Reservation.find(reservation_id)
    ReservationMailer.reservation_email(user, listing, reservation).deliver_now
  end
end
