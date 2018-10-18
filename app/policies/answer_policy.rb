# frozen_string_literal: true

class AnswerPolicy < ApplicationPolicy
  def destroy?
    if record.about_type == 'Supplier'
      record.about.user.id == user.id
    elsif record.about_type == 'Material'
      record.about.supplier.user.id == user.id
    else
      false
    end
  end
end
