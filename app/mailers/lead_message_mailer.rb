class LeadMessageMailer < ApplicationMailer
  def email
    @name = params[:name]
    @from = params[:from]
    @phone = params[:phone]
    @interesse = params[:interesse]
    @admin = params[:admin]


      mail(
        to: @admin.email,
        subject: 'Novo Contato recebido do site MateriaMundi',
        from: @from,
        reply_to: @from
      )
  end
end
