# frozen_string_literal: true

class Question < ApplicationRecord
  validates :questionnaire, :description, :sorting, presence: true
  validates :weight_for_small_companies, :weight_for_medium_companies,
    :weight_for_large_companies, :weight_for_service_companies,
    numericality: {
      only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 3
    }

  belongs_to :questionnaire
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options

  def as_json(_options = {})
    {
      id: id,
      description: description,
      helper_text: helper_text,
      options: options.order(:value).as_json
    }
  end
end
