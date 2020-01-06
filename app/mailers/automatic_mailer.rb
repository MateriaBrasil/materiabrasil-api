class AutomaticMailer < ApplicationMailer
  def email
    @name = params[:name]
    @from = params[:from]
    @url = params[:url]

    mail(
        to: 'representacao@materiabrasil.net',
        subject: 'Usuário solicitando ajuda para compra de material',
        from: @from,
        reply_to: @from
      )
  end
end
