# Preview all emails at http://localhost:3000/rails/mailers/material
class MaterialPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/material/confirmation
  def confirmation
    MaterialMailer.confirmation
  end

end
