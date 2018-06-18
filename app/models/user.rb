# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true
  validates :email, presence: true

  def as_json(_options = {})
    {
      id: id,
      email: email,
      name: name
    }
  end

  def tokens_has_json_column_type?
    false
  end
end
