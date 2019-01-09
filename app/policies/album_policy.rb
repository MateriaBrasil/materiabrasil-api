# frozen_string_literal: true

class AlbumPolicy < ApplicationPolicy
  def show?
    record.user == user ? true : !record.private
  end

  def favorites?
    record.user == user ? true : !record.private
  end
end
