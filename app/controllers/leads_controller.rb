class LeadsController < ApplicationController
  def create
    name = params[:name]
    from = params[:email]
    phone = params[:phone]
    admins = User.where(admin: true)
    admins.each{ |a| LeadMessageMailer.with(name: name, from: from, phone: phone, admin: a).email.deliver_later }     
  end
end
