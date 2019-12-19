class SupplierLeadMessageMailer < ApplicationMailer
  def email
    @name = params[:name]
    @from = params[:from]
    @phone = params[:phone]
    @message = params[:message]
    @supplier = params[:supplier]


      mail(
        to: @supplier.email,
        subject: 'Novo Contato recebido do site MateriaMundi',
        from: @from,
        reply_to: @from
      )
  end
end
