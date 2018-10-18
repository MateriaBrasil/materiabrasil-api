# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE /answers/:id', type: :request do
  let(:questionnaire) do
    Questionnaire.create(
      name: 'Foo',
      about_type: 'Supplier',
      driver: 'first_driver',
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

  let(:supplier) do
    Supplier.create!(
      user: user,
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

  let(:user) { current_user }

  let(:answer) do
    Answer.create!(
      about_id: supplier.id,
      about_type: 'Supplier',
      question_id: question.id,
      option_id: option.id
    )
  end

  let(:id) { answer.id }
  let(:params) { nil }
  let(:headers) { {} }

  context 'with answer not found' do
    let(:id) { answer.id + 1 }

    before { delete "/answers/#{id}", params: params }

    it { expect(response).to have_http_status(:not_found) }
  end

  context 'with answer found' do
    context 'when it belongs to current_user' do
      before { delete "/answers/#{id}", params: params }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(answer.to_json) }
      it { expect(Answer.find_by(id: answer.id)).to be(nil) }
    end

    context 'when it belongs to another user' do
      let(:user) do
        User.create!(
          email: 'bar@foo.com',
          first_name: 'Foo',
          last_name: 'Bar',
          password: 'foobarfoo'
        )
      end

      before { delete "/answers/#{id}", params: params }

      it { expect(response).to have_http_status(:forbidden) }
    end
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    before { delete "/answers/#{id}", params: params }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
