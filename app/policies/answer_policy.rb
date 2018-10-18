# frozen_string_literal: true

class AnswerPolicy < ApplicationPolicy
  def destroy?
    record_user = record.about&.user || record.about&.supplier&.user
    record_user.id == user.id
  end
end
