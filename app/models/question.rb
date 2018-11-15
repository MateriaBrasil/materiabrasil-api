# frozen_string_literal: true

class Question < ApplicationRecord
  validates :questionnaire, :description, :sorting, presence: true

  belongs_to :questionnaire
  has_many :options, dependent: :restrict_with_exception

  def as_json(_options = {})
    {
      id: id,
      description: description,
      options: options.order(:value).as_json
    }
  end
end
