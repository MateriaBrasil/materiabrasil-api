# frozen_string_literal: true

class Review < ApplicationRecord
  validates :text, :user, :rating, :reviewable, presence: true
  validates :rating, inclusion: { in: 1..5 }
  validates :user, uniqueness: { scope: %i[reviewable_type reviewable_id] }

  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  def as_json(_options = {})
    {
      id: id,
      user: user.as_json,
      text: text,
      rating: rating,
      created_at: created_at
    }
  end
end
