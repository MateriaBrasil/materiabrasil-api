class LeadsController < ApplicationController
  def create
    if params[:mail_type] == 'admin'
      name = params[:name]
      from = params[:email]
      phone = params[:phone]
      interesse = params[:interesse]
      admins = User.where(admin: true)
      admins.each{ |a| LeadMessageMailer.with(name: name, from: from, phone: phone, interesse: interesse, admin: a).email.deliver_later } 
    elsif params[:mail_type] == 'supplier'
      save_on_db
      name = params[:name]
      from = params[:email]
      phone = params[:phone]
      message = params[:msg]
      supplier = Supplier.find(params[:supplier_id])
      SupplierLeadMessageMailer.with(name: name, from: from, phone: phone, message: message, supplier: supplier).email.deliver_later
    elsif params[:mail_type] == 'automatic_message'
      name = params[:name]
      url = params[:url]
      from = params[:email]
      AutomaticMailer.with(name: name, url: url, from: from).email.deliver_later
    end
  end

  def save_on_db
    user = User.find(params[:from_id])
    message = Message.create!(message_params.merge(from: user))
    render json: message.errors, status: :created
  end


  def message_params
    params.require(:lead).permit(:from_type, :from_id, :to_type, :to_id, :text)
  end
end