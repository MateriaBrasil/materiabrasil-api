# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :text, :user, :commentable, presence: true

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def as_json(_options = {})
    {
      id: id,
      text: text,
      user_id: user.id
    }
  end
end
