# frozen_string_literal: true

class Question < ApplicationRecord
  validates :questionnaire, :description, :sorting, presence: true

  belongs_to :questionnaire
end
