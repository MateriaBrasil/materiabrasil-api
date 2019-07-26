# frozen_string_literal: true

class Answer < ApplicationRecord
  validates :about, :question, :option, presence: true

  validates :question_id,
    uniqueness: { scope: %i[about_type about_id], message: 'já respondeu.' }

  belongs_to :about, polymorphic: true
  belongs_to :question
  belongs_to :option

  scope :by_driver, ->(driver) do
    joins(question: :questionnaire)
      .where(questionnaires: { driver: driver })
      .order('questions.sorting ASC')
  end

  scope :not_zero, -> do
    joins(:option).where.not(options: { value: 0 })
  end

  def as_json(_options = {})
    {
      id: id,
      about_id: about_id,
      about_type: about_type,
      question_id: question_id,
      option_id: option_id
    }
  end
end
