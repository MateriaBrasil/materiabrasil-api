# frozen_string_literal: true

class Favorite < ApplicationRecord
  validates :album, :favoritable, presence: true

  belongs_to :album
  belongs_to :favoritable, polymorphic: true

  def as_json(_options = {})
    {
      id: id,
      album_id: album.id,
      favoritable_id: favoritable.id,
      favoritable_type: favoritable.class.name
    }
  end
end
