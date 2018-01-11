class ReservationMailer < ApplicationMailer
    def reservation_email(user, listing, reservation)
      @user = user
      @listing = listing
      @reservation = reservation
      mail(to: @user.email, subject: 'Sample Email')
    end

end
