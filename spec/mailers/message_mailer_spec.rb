# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageMailer, type: :mailer do
  describe 'email' do
    let(:mail) { MessageMailer.email }

    let(:supplier) do
      Supplier.create!(
        name: 'Foo Bar',
        description: 'Foo description',
        website: 'http://foo',
        email: 'rodrigo@seasoned.cc',
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
        text: 'Blablabla wiskas sache'
      )
    end

    it 'renders the headers' do
      expect(mail.subject).to eq(['Contato através do MateriaMundi'])
      expect(mail.to).to eq(['rodrigo@seasoned.cc'])
      expect(mail.from).to eq([current_user.email])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
