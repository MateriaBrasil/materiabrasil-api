# Preview all emails at http://localhost:3000/rails/mailers/automatic
class AutomaticPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/automatic/email
  def email
    AutomaticMailer.email
  end

end
