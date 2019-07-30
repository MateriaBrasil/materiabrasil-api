# frozen_string_literal: true

require 'rails_helper'

describe 'GET /categories', type: :request do
  let(:categories) do
    3.times do |index|
      category = Category.create!(
        id: index + 1,
        name: "Classificação #{index}",
        sorting: index
      )

      3.times do |index2|
        category.children.create(
          id: "#{index + 1}#{index2}".to_i,
          name: "Children #{index + 1}#{index2}",
          sorting: index2 + 1
        )
      end
    end
  end

  let(:expected_body) do
    [
      { parent_id: nil,
        id: 1,
        name: 'Classificação 0',
        sorting: 0,
        multiple_choice: true,
        children: [
          {
            parent_id: 1,
            id: 10,
            name: 'Children 10',
            sorting: 1,
            multiple_choice: true,
            children: []
          },
          {
            parent_id: 1,
            id: 11,
            name: 'Children 11',
            sorting: 2,
            multiple_choice: true,
            children: []
          },
          {
            parent_id: 1,
            id: 12,
            name: 'Children 12',
            sorting: 3,
            multiple_choice: true,
            children: []
          }
        ] },
      { parent_id: nil,
        id: 2,
        name: 'Classificação 1',
        sorting: 1,
        multiple_choice: true,
        children: [
          {
            parent_id: 2,
            id: 20,
            name: 'Children 20',
            sorting: 1,
            multiple_choice: true,
            children: []
          },
          {
            parent_id: 2,
            id: 21,
            name: 'Children 21',
            sorting: 2,
            multiple_choice: true,
            children: []
          },
          {
            parent_id: 2,
            id: 22,
            name: 'Children 22',
            sorting: 3,
            multiple_choice: true,
            children: []
          }
        ] },
      { parent_id: nil,
        id: 3,
        name: 'Classificação 2',
        sorting: 2,
        multiple_choice: true,
        children: [
          {
            parent_id: 3,
            id: 30,
            name: 'Children 30',
            sorting: 1,
            multiple_choice: true,
            children: []
          },
          {
            parent_id: 3,
            id: 31,
            name: 'Children 31',
            sorting: 2,
            multiple_choice: true,
            children: []
          },
          {
            parent_id: 3,
            id: 32,
            name: 'Children 32',
            sorting: 3,
            multiple_choice: true,
            children: []
          }
        ] }
    ]
  end

  before do
    categories
    get '/categories'
  end

  it { expect(response).to have_http_status(:ok) }
  it { expect(response.body).to eq(expected_body.to_json) }
end
