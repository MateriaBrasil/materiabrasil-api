# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  protected

  def admin?
    user.try(:admin?) || false
  end
  
  def owner_or_admin?
    record.user == user || admin?
  end
end
