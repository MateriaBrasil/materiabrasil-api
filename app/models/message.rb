# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true

  validates :from, :to, :text, presence: true

  def as_json(_options = {})
    {
      id: id,
      from: from.as_json,
      to: to.as_json,
      text: text,
      created_at: created_at
    }
  end
end
