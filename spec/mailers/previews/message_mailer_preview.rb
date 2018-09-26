# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/email
  def email
    @user = User.first

    @supplier = Supplier.create!(  
      name: 'Foo Bar',
      description: 'Foo description',
      website: 'http://foo',
      email: 'foo@bar.com',
      cnpj: '123456789',
      company_name: 'Foo Inc',
      municipal_subscription: 'does not apply',
      state_subscription: '987654321',
      phone: '5551987654321',
      company_revenue: '100000000',
      number_of_employees: 1000,
      reach: 'country',
      image_url: 'http://foo-image',
      user: @user
    )
    @message = Message.create!(
      from: @user,
      to: @supplier,
      text: 'Foos text'
    )
    MessageMailer.with(message: @message).email
  end
end
