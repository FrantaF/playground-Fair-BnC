class PostmanWorker < ActiveJob::Base
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    ReservationMailer.reservation_email(user).deliver_now
  end
end
