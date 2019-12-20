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
      name = params[:name]
      from = params[:email]
      phone = params[:phone]
      message = params[:message]
      supplier = Supplier.find(params[:supplier_id])
      SupplierLeadMessageMailer.with(name: name, from: from, phone: phone, message: message, supplier: supplier).email.deliver_later
    end
  end
end