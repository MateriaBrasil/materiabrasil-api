# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :comments, dependent: :restrict_with_exception
  has_many :reviews, dependent: :restrict_with_exception
  has_many :albums, dependent: :restrict_with_exception
  has_many :suppliers, dependent: :restrict_with_exception

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def as_json(options = {})
    {
      id: id,
      email: email,
      first_name: first_name,
      last_name: last_name,
      image_url: image_url,
      city: city,
      state: state,
      country: country,
      bio: bio,
      company: company,
      work_title: work_title,
      website: website,
      albums: options[:only_public_albums] ? albums.public : albums,
      suppliers: suppliers,
      public_profile: public_profile
    }
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def tokens_has_json_column_type?
    false
  end
end
