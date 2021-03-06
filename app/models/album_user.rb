# frozen_string_literal: true

class AlbumUser < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates :user, presence: true
  validates :album, presence: true
  validates :user_id, uniqueness: { scope: :album_id }

  def as_json(_options = {})
    {
      id: id,
      user_id: user_id,
      album_id: album_id
    }
  end
end
