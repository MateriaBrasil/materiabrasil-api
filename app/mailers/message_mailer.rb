# frozen_string_literal: true

class MessageMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.email.subject
  #
  def email(message)
    @message = message
    @from = current_user
    mail to: @message.to.email, subject: 'Contato através do MateriaMundi'
  end
end
