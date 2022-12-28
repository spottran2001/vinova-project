class ExampleMailer < ApplicationMailer
	default from: "from@example.com"
	layout "mailer"

  def sample_email(email)
    @email = email
    mail(to: @email, subject: "About use")
  end

  def daily_mail_for_user(email)
    @email = email
    mail(to: @email, subject: "This is for user")
  end
end
