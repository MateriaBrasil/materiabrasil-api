# frozen_string_literal: true

class Answer < ApplicationRecord
  validates :about, :question, :option, presence: true

  validates :question_id,
    uniqueness: { scope: %i[about_type about_id], message: 'já respondeu.' }

  belongs_to :about, polymorphic: true
  belongs_to :question
  belongs_to :option
end
