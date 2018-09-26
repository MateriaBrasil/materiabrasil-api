# frozen_string_literal: true

class MessageMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.email.subject
  #
  def email
    @message = params[:message]
    @from = @message.from
    mail to: @message.to.email, subject: 'Contato através do MateriaMundi'
  end
end
