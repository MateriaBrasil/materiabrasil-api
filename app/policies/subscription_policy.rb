# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    user
  end

  def activate?
    true
  end
end
