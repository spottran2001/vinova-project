class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(*email)
    @email = email
    ExampleMailer.daily_mail_for_user(@email).deliver_now
  end
end
