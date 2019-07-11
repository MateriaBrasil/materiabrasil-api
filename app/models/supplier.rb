# frozen_string_literal: true

class Supplier < ApplicationRecord
  validates :name, :description, :website, :email, :cnpj, :company_name,
    :municipal_subscription, :state_subscription, :phone, :reach, presence: true

  validates :type_of_company, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 4,
    only_integer: true
  }

  belongs_to :user
  has_many :addresses, dependent: :restrict_with_exception
  has_many :materials, dependent: :restrict_with_exception
  has_many :answers, as: :about, inverse_of: :about,
                     dependent: :destroy

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def as_json(_options = {})
    {
      id: id,
      name: name,
      description: description,
      website: website,
      email: email,
      cnpj: cnpj,
      company_name: company_name,
      municipal_subscription: municipal_subscription,
      state_subscription: state_subscription,
      phone: phone,
      company_revenue: company_revenue,
      reach: reach,
      image_url: image_url,
      user_id: user.id,
      materials: materials,
      type_of_company: type_of_company
    }
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
