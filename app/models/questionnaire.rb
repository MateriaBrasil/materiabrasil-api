# frozen_string_literal: true

class Questionnaire < ApplicationRecord
  validates :name, :about_type, :driver, :sorting, presence: true
  has_many :questions, dependent: :restrict_with_exception

  def as_json(_options = {})
    {
      id: id,
      name: name,
      about_type: about_type,
      driver: driver,
      sorting: sorting,
      questions: questions.order(:sorting).as_json
    }
  end
end
