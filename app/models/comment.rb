# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :text, :user, :commentable, presence: true

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def as_json(_options = {})
    {
      id: id,
      user: user.as_json,
      text: text,
      created_at: created_at
    }
  end
end
