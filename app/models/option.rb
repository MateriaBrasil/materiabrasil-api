# frozen_string_literal: true

class Option < ApplicationRecord
  validates :question, :description, :value, presence: true

  belongs_to :question
end
