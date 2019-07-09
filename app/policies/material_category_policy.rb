# frozen_string_literal: true

class MaterialCategoryPolicy < ApplicationPolicy
  def create?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  protected

  def owner_or_admin?
    admin? || record.material.user == user
  end
end
