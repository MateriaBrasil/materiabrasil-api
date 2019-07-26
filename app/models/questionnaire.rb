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

  def questions_by_company_type(type_of_company)
    questions.where.not(:"weight_for_#{type_of_company}_companies" => 0)
  end

  def completed_by(supplier_or_material)
    answers = supplier_or_material.answers.by_driver(driver)
    questions = questions_by_company_type(supplier_or_material.type_of_company)
    questions.count == answers.count
  end

  private

  def filtered_questions(type_of_company)
    if type_of_company.present?
      questions_by_company_type(type_of_company)
    else
      questions
    end.order(:sorting).as_json
  end
end
