# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageMailer, type: :mailer do
  describe '#email' do
    let(:supplier) do
      Supplier.create!(
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
        user: current_user
      )
    end

    let(:message) do
      Message.create!(
        from: current_user,
        to: supplier,
        text: 'Foo text'
      )
    end

    let(:mail) do
      MessageMailer.with(message: message).email
    end

    it { expect(mail.subject).to eq('Contato através do MateriaMundi') }
    it { expect(mail.to).to eq([supplier.email]) }
    it { expect(mail.from).to eq(['cadastro@materiabrasil.net']) }
    it { expect(mail.body.encoded).to match(message.text) }
  end
end
