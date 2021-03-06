# frozen_string_literal: true

class Album < ApplicationRecord
  validates :user, :name, presence: true

  belongs_to :user
  has_many :favorites, dependent: :restrict_with_exception
  has_many :users, through: :album_users
  has_many :album_users, dependent: :destroy

  def self.public
    where(private: false)
  end

  def as_json(_options = {})
    {
      id: id,
      user_id: user.id,
      name: name,
      default: default,
      private: private
    }
  end
end
