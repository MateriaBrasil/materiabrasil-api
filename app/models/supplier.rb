# frozen_string_literal: true

class Supplier < ApplicationRecord
  extend FriendlyId
  
  friendly_id :slug_candidates, use: :slugged

  validates :name, :description, :website, :email, :cnpj, :company_name,
    :municipal_subscription, :state_subscription, :phone, :reach, presence: true

  enum type_of_company: { small: 1, medium: 2, large: 3, service: 4 }

  belongs_to :user
  has_many :addresses, dependent: :restrict_with_exception
  has_many :materials, dependent: :restrict_with_exception
  has_many :answers, as: :about, inverse_of: :about,
                     dependent: :destroy

  accepts_nested_attributes_for :addresses, allow_destroy: true

  def duplicates_count
    Supplier.where(name: self.name).count + 1
  end

  def slug_candidates
    [
      :name,
      [:name, :duplicates_count]
    ]
  end

  def questionnaires_answered
    answers = Answer.where(about_type: 'Supplier', about_id: id).count
    questionnaire_ids = Questionnaire.where(about_type: 'Supplier').pluck(:id)

    case Supplier.type_of_companies[type_of_company]
    when 1
      tipe_per_weight = 'weight_for_small_companies'
    when 2
      tipe_per_weight = 'weight_for_medium_companies'
    when 3
      tipe_per_weight = 'weight_for_large_companies'
    when 4
      tipe_per_weight = 'weight_for_service_companies'
    end

    questions = Question.where(questionnaire_id: questionnaire_ids).where.not(tipe_per_weight.to_sym => 0).count

    if answers < questions
      false
    else
      true
    end

  end

  def type_of_company_index
    Supplier.type_of_companies[type_of_company]
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def as_json(_options = {})
    {
      id: id,
      slug: slug,
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
      questionnaires_completed: questionnaires_answered,
      materials: materials,
      addresses: addresses.first,
      type_of_company: type_of_company_index,
    }
  end

  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
