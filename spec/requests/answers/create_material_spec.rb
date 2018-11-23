# frozen_string_literal: true

require 'rails_helper'

describe 'POST /answers', type: :request do
  let(:headers) { {} }

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

  let(:material) do
    Material.create!(
      name: 'Foo material',
      supplier_id: supplier.id,
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234',
      unit_of_sale: 'foo unit',
      minimum_purchase_quantity: 10,
      maximum_purchase_quantity: 100,
      ncm_code: '03022300',
      sh_code: '0103.91',
      certifications: 'foo certifications',
      certifications_url: 'https://certifications.foo',
      prizes: 'Prizes bar',
      density: 'Some density',
      dimensions: 'Some dimensions'
    )
  end

  let(:questionnaire) do
    Questionnaire.create(
      name: 'Foo',
      about_type: 'Material',
      driver: 'materiality_driver',
      sorting: 123
    )
  end

  let(:question) do
    Question.create(
      questionnaire: questionnaire,
      description: 'Foo bar',
      sorting: 123
    )
  end

  let(:option) do
    Option.create(
      question: question,
      description: 'Foo bar',
      value: 123
    )
  end

  let(:answer) do
    Answer.create(
      question_id: question.id,
      option_id: option.id,
      about_type: 'Material',
      about_id: material.id
    )
  end

  let(:params) do
    {
      about_id: material.id,
      about_type: 'Material',
      question_id: question.id,
      option_id: option.id
    }
  end

  before do
    post '/answers', headers: headers, params: params.to_json
  end

  context 'with incorrect params' do
    let(:params) { { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    let(:answer) { Answer.first }

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(answer.to_json) }
    it { expect(answer).to eq(answer) }
  end
end
