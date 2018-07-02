# frozen_string_literal: true

class Album < ApplicationRecord
  validates :user, :name, :default, presence: true

  belongs_to :user

  def as_json(_options = {})
    {
      id: id,
      user: user.as_json,
      name: name,
      default: default
    }
  end
end
