# frozen_string_literal: true

class FavoritePolicy < ApplicationPolicy
  def destroy?
    record.album.user == user
  end
end
