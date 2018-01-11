class ReservationMailer < ApplicationMailer
    def reservation_email(user)
      @user = user
      mail(to: @user.email, subject: 'Sample Email')
    end

end
