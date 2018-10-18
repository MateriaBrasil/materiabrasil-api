# frozen_string_literal: true

class Answer < ApplicationRecord
  validates :about, :question, :option, presence: true

  validates :question_id,
    uniqueness: { scope: %i[about_type about_id], message: 'já respondeu.' }

  belongs_to :about, polymorphic: true
  belongs_to :question
  belongs_to :option

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
