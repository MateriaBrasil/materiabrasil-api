# frozen_string_literal: true

class Option < ApplicationRecord
  validates :question, :description, :value, presence: true

  belongs_to :question

  def as_json(_options = {})
    {
      id: id,
      description: description,
      value: value
    }
  end
end
