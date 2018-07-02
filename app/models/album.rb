# frozen_string_literal: true

class Album < ApplicationRecord
  validates :user, :name, presence: true

  belongs_to :user
  has_many :favorites, dependent: :restrict_with_exception

  def as_json(_options = {})
    {
      id: id,
      user: user.as_json,
      name: name,
      default: default
    }
  end
end
