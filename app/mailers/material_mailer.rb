class MaterialMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.material_mailer.confirmation.subject
  #
  def confirmation
    @material = params[:material]
    @web_url = params[:web_url]
    @admin = params[:admin]


      mail(
        to: @admin.email,
        subject: 'Novo Material para ser publicado',
        from: 'admin@materiabrasil.net',
        reply_to: 'noreply@materiabrasil.net'
      )
  end
end
