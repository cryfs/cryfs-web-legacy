class Contact < MailForm::Base
  attribute :email
  validates :email, email_format: {message: "Invalid email address", allow_blank: true}
  attribute :message, validate: true
  attribute :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    from = email
    if from == ""
      from = "[unknown]"
    end
    {
      subject: "CryFS Contact Form (from #{from})",
      to: "mail@smessmer.de",
      from: %("CryFS Contact Form" <contactform@cryfs.org>),
      reply_to: email
    }
  end
end
