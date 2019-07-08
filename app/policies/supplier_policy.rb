# frozen_string_literal: true

class SupplierPolicy < ApplicationPolicy
  def update?
    owner_or_admin?
  end
end
