class LeadsController < ApplicationController
  def create
    name = params[:name]
    from = params[:email]
    phone = params[:phone]
    interesse = params[:interesse]
    admins = User.where(admin: true)
    admins.each{ |a| LeadMessageMailer.with(name: name, from: from, phone: phone, interesse: interesse, admin: a).email.deliver_later }     
  end
end
