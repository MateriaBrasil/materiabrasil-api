# frozen_string_literal: true

class Questionnaire < ApplicationRecord
  validates :name, :about_type, :driver, :sorting, presence: true
  has_many :questions, dependent: :restrict_with_exception

  def as_json(options = {})
    {
      id: id,
      name: name,
      about_type: about_type,
      driver: driver,
      sorting: sorting,
      questions: filtered_questions(options)
    }
  end

  private

  def filtered_questions(options)
    if options.present?
      size = options.type_of_company
      questions.where.not(:"weight_for_#{size}_companies" => 0)
    else
      questions
    end.order(:sorting).as_json
  end
end
