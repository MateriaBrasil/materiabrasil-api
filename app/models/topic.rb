# frozen_string_literal: true

class Topic < ApplicationRecord
  validates :text, :subject, :user, presence: true

  belongs_to :user
  has_many :comments,
    as: :commentable,
    inverse_of: :commentable,
    dependent: :restrict_with_exception

  def as_json(_options = {})
    {
      id: id,
      user: user.as_json,
      subject: subject,
      text: text,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
