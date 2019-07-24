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
      questions: filtered_questions(options[:type_of_company])
    }
  end

  private

  def filtered_questions(type_of_company)
    if type_of_company.present?
      questions.where.not(:"weight_for_#{type_of_company}_companies" => 0)
    else
      questions
    end.order(:sorting).as_json
  end
end
