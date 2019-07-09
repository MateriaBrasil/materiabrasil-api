# frozen_string_literal: true

class AnswerPolicy < ApplicationPolicy
  def create?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  protected

  def owner_or_admin?
    record_user = record.about&.user || record.about&.supplier&.user
    record_user.id == user.id || admin?
  end
end
