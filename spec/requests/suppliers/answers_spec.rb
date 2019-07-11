# frozen_string_literal: true

require 'rails_helper'

describe 'GET /suppliers/:id/answers', type: :request do
  subject(:body) { JSON.parse(response.body) }

  let(:supplier) do
    Supplier.create!(
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
      type_of_company: 1,
      reach: 'country',
      image_url: 'http://foo-image',
      user: current_user
    )
  end

  let(:id) { supplier.id }

  let(:option) do
    Option.create(
      question: question,
      description: 'Foo bar',
      value: 123
    )
  end

  let(:another_option) do
    Option.create(
      question: another_question,
      description: 'Foo bar foo',
      value: 321
    )
  end

  let(:question) do
    Question.create(
      questionnaire: questionnaire,
      description: 'Foo bar',
      sorting: 123
    )
  end

  let(:another_question) do
    Question.create(
      questionnaire: questionnaire,
      description: 'Foo bar foo',
      sorting: 321
    )
  end

  let(:questionnaire) do
    Questionnaire.create(
      name: 'Foo',
      about_type: 'Supplier',
      driver: 'materiality_driver',
      sorting: 123
    )
  end

  before do
    Answer.create!(
      about: supplier,
      question: question,
      option: option
    )
    Answer.create!(
      about: supplier,
      question: another_question,
      option: another_option
    )

    get "/suppliers/#{id}/answers"
  end

  context 'with supplier not found' do
    let(:id) { supplier.id + 1000 }

    it 'returns not found' do
      expect(response).to have_http_status(:not_found)
    end
  end

  context 'with supplier found' do
    it { expect(response).to have_http_status(:ok) }
    it { is_expected.to eq(JSON.parse(supplier.answers.to_json)) }
    it { expect(body.length).to eq(2) }
  end
end
