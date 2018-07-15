# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true
  validates :email, presence: true
  validates :public_profile, presence: true

  has_many :comments, dependent: :restrict_with_exception
  has_many :reviews, dependent: :restrict_with_exception
  has_many :albums, dependent: :restrict_with_exception

  def as_json(_options = {})
    {
      id: id,
      email: email,
      name: name,
      albums: albums,
      public_profile: public_profile
    }
  end

  def tokens_has_json_column_type?
    false
  end
end
