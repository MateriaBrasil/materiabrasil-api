# frozen_string_literal: true

class Questionnaire < ApplicationRecord
  validates :name, :about_type, :driver, :sorting, presence: true
end
