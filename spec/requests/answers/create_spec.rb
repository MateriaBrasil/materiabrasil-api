# frozen_string_literal: true

require 'rails_helper'

describe 'POST /answers', type: :request do
  let(:answer) { Answer.first }
  let(:headers) { {} }

  let(:params) do
    {
      about: supplier,
      question: question,
      option: option
    }
  end

  let(:supplier) do
    Supplier.create!(
      user: current_user,
      name: 'Foo Bar',
      description: 'Foo description',
      website: 'http://foo',
      email: 'foo@company.com',
      cnpj: '123456789',
      company_name: 'Foo Inc',
      municipal_subscription: 'does not apply',
      state_subscription: '987654321',
      phone: '5551987654321',
      company_revenue: '100000000',
      number_of_employees: 1000,
      reach: 'country',
      image_url: 'http://foo-image'
    )
  end

  let(:option) do
    Option.create(
      question: question,
      description: 'Foo bar',
      value: 123
    )
  end
  
  let(:question) do
    Question.create(
      questionnaire: questionnaire,
      description: 'Foo bar',
      sorting: 123
    )
  end

  let(:questionnaire) do
    Questionnaire.create(
      name: 'Foo',
      about_type: 'Supplier',
      driver: 'first_driver',
      sorting: 123
    )
  end

  before do
    post '/answers', headers: headers, params: params.to_json
  end

  # context 'with incorrect params' do
  #   let(:params) { { foo: 'bar' } }

  #   it { expect(response).to have_http_status(:bad_request) }
  # end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(answer.to_json) }
    it { expect(answer.supplier).to eq(supplier) }
  end
end
