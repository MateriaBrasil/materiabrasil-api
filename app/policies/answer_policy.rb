# frozen_string_literal: true

class AnswerPolicy < ApplicationPolicy
  def destroy?
    record.about.id == user.id
  end
end
