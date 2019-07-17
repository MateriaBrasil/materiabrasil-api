# frozen_string_literal: true

class Supplier < ApplicationRecord
  validates :name, :description, :website, :email, :cnpj, :company_name,
    :municipal_subscription, :state_subscription, :phone, :reach, presence: true

  enum type_of_company: { small: 1, medium: 2, large: 3, service: 4 }

  belongs_to :user
  has_many :addresses, dependent: :restrict_with_exception
  has_many :materials, dependent: :restrict_with_exception
  has_many :answers, as: :about, inverse_of: :about,
                     dependent: :destroy

  def type_of_company_index
    Supplier.type_of_companies[type_of_company]
  end

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
      type_of_company: type_of_company_index
    }
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
