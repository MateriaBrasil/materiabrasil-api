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
      type_of_company: 1,
      reach: 'country',
      image_url: 'http://foo-image'
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

  let(:question) do
    Question.create(
      questionnaire: questionnaire,
      description: 'Foo bar',
      sorting: 123,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 1,
      weight_for_service_companies: 1
    )
  end

  let(:question2) do
    Question.create!(
      questionnaire: questionnaire,
      description: 'Foo bar',
      sorting: 124,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 1,
      weight_for_service_companies: 1
    )
  end

  let(:option) do
    Option.create(
      question: question,
      description: 'Foo bar',
      value: 123
    )
  end

  let(:option2) do
    Option.create(
      question: question,
      description: 'Foo bar',
      value: 123
    )
  end

  let(:existingAnswer) do
    Answer.create(
      question_id: question.id,
      option_id: option2.id,
      about_type: 'Supplier',
      about_id: supplier.id
    )
  end

  let(:params) do
    {
      about_id: supplier.id,
      about_type: 'Supplier',
      question_id: question.id,
      option_id: option.id
    }
  end

  context 'with incorrect params' do
    before do
      post '/answers', headers: headers, params: params.to_json
    end

    let(:params) { { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    before do
      post '/answers', headers: headers, params: params.to_json
    end

    let(:headers) { { 'access-token' => nil } }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with another user' do
    before do
      post '/answers', headers: headers, params: params.to_json
    end

    let(:another_user) do
      User.create!(
        email: 'another@bar.com',
        first_name: 'another',
        last_name: 'Bar',
        password: 'anotherbaranother',
        iugu_id: '1',
        admin: false
      )
    end

    let(:headers) { another_user.create_new_auth_token }

    it { expect(response).to have_http_status(:forbidden) }
  end

  context 'with current_user' do
    before do
      post '/answers', headers: headers, params: params.to_json
    end

    let(:answer) { Answer.first }
    let(:answer2) { Answer.second }

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(answer.to_json) }
    it { expect(answer).to eq(answer) }
    it { expect(answer2).to be(nil) }
  end

  context 'with current_user AND answering all questions' do
    before do
      post '/answers', headers: headers, params: params.to_json
    end

    let(:answer) { Answer.first }

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(answer.to_json) }
    it { expect(answer).to eq(answer) }
    it {
      expect(CalculateTopsisJob).to have_been_enqueued.with(
        questionnaire.driver, supplier
      )
    }
  end

  context 'with current_user AND NOT answering all questions' do
    before do
      question2
      post '/answers', headers: headers, params: params.to_json
    end

    let(:answer) { Answer.first }

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(answer.to_json) }
    it { expect(answer).to eq(answer) }
    it {
      expect(CalculateTopsisJob).not_to have_been_enqueued.with(
        questionnaire.driver, supplier
      )
    }
  end
end
