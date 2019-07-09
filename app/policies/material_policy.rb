# frozen_string_literal: true

class MaterialPolicy < ApplicationPolicy
  def update?
    owner_or_admin?
  end
end
