# frozen_string_literal: true

class Supplier < ApplicationRecord
  validates :name, :description, :website, :email, :cnpj, :company_name,
    :municipal_subscription, :state_subscription, :phone, :reach, presence: true

  belongs_to :user

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
      number_of_employees: number_of_employees,
      reach: reach,
      image_url: image_url,
      user_id: user.id
    }
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
