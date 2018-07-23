# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    record.public_profile? || user == record
  end
end
