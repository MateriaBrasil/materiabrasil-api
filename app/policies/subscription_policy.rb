# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    user
  end

  def activate?
    true
  end
end
