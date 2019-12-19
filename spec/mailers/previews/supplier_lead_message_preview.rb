# Preview all emails at http://localhost:3000/rails/mailers/supplier_lead_message
class SupplierLeadMessagePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/supplier_lead_message/email
  def email
    SupplierLeadMessageMailer.email
  end

end
