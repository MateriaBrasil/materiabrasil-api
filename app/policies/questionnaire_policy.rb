# frozen_string_literal: true

class QuestionnairePolicy < ApplicationPolicy
  def recalculate_topsis?
    admin?
  end
end
