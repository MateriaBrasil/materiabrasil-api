# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/email
  def email
    MessageMailerMailer.email
  end
end
