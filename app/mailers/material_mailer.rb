class MaterialMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.material_mailer.confirmation.subject
  #
  def confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
