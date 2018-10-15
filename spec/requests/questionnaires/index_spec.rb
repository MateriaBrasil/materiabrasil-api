# frozen_string_literal: true

require 'rails_helper'

describe 'GET /questionnaires', type: :request do
  before do
    %w[foo bar baz].each_with_index do |text, index|
      questionnaire = Questionnaire.create!(
        name: text,
        about_type: 'Supplier',
        driver: 'first_driver',
        sorting: index
      )
      question = questionnaire.questions.create!(
        description: text, sorting: 123
      )
      question.options.create!(description: 'foobar', value: 132)
    end
    Questionnaire.create!(
      name: 'barfoo',
      about_type: 'Foobar',
      driver: 'second_driver',
      sorting: 123
    )
  end

  context 'with questionnaires with about_type Supplier' do
    before { get '/questionnaires', params: { about_type: 'Supplier' } }

    it { expect(response).to have_http_status(:ok) }
    it do
      expect(response.body).to eq(
        Questionnaire.where(about_type: 'Supplier').order(:sorting).to_json
      )
    end
    it { expect(JSON.parse(response.body).length).to eq(3) }
  end

  context 'with incorrect request' do
    before { get '/topics', params: { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
