# frozen_string_literal: true

class Material < ApplicationRecord
  include PgSearch
  extend FriendlyId
  
  friendly_id :slug_candidates, use: :slugged
  before_save :despublica, unless: :new_record?



  validates :name, :description, :average_price, :code, presence: true

  has_many :comments,
    as: :commentable,
    inverse_of: :commentable,
    dependent: :restrict_with_exception

  has_many :reviews,
    as: :reviewable,
    inverse_of: :reviewable,
    dependent: :restrict_with_exception

  has_many :favorites,
    as: :favoritable,
    inverse_of: :favoritable,
    dependent: :restrict_with_exception

  has_many :material_categories, dependent: :destroy
  has_many :categories, through: 'material_categories'

  has_many :answers,
    as: :about,
    inverse_of: :about,
    dependent: :destroy

  belongs_to :supplier

  delegate :user, :type_of_company, to: :supplier

  pg_search_scope :search,
    against: %i[name code ncm_code sh_code],
    associated_against: {
      supplier: %i[name]
    },
    ignoring: :accents
    # using: {
    #   tsearch: { any_word: false, prefix: true },
    #   trigram: { threshold: 0.03 }
    # },

  def self.with_categories(ids)
    joins(:categories).where(categories: { id: ids }).or(joins(:categories).where(categories: { slug: ids}))
  end

  def duplicates_count
    Material.where(name: self.name).count + 1
  end

  def slug_candidates
    [
      :name,
      [:name, :duplicates_count]
    ]
  end


  def questionnaires_answered
    answers = Answer.where(about_type: 'Material', about_id: id).count
    questionnaire_ids = Questionnaire.where(about_type: 'Material').pluck(:id)

    material_supplier = Supplier.friendly.find(self.supplier_id)
    
    case Supplier.type_of_companies[material_supplier.type_of_company]
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

  def category
    MaterialCategory.where(material_id: id).count.positive?
  end

  def despublica
    self.update_column 'published', false
    
    unless self.pre_published_changed?
      self.update_column 'pre_published', false
    end
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def as_json(_options = {})
    {
      id: id,
      slug: slug,
      name: name,
      image_url: image_url,
      description: description,
      average_price: average_price,
      code: code,
      technical_specification_url: technical_specification_url,
      average_rating: average_rating,
      highlighted: highlighted,
      cover_image_url: cover_image_url,
      highlight_image_url: highlight_image_url,
      list_image_url: list_image_url,
      supplier_id: supplier.id,
      supplier_name: supplier.name,
      supplier_slug: supplier.slug,
      unit_of_sale: unit_of_sale,
      minimum_purchase_quantity: minimum_purchase_quantity,
      maximum_purchase_quantity: maximum_purchase_quantity,
      ncm_code: ncm_code,
      sh_code: sh_code,
      certifications: certifications,
      certifications_url: certifications_url,
      prizes: prizes,
      density: density,
      dimensions: dimensions,
      availability: availability,
      materiality_driver: materiality_driver,
      manufacture_driver: manufacture_driver,
      management_driver: management_driver,
      social_driver: social_driver,
      published: published,
      pre_published: pre_published,
      questionnaires_completed: questionnaires_answered,
      category: category,
      state: state,
      categories: self.categories,
      categories_has_page: self.categories.has_page_true
    }
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def average_rating
    average = reviews.average('rating')
    average && average.to_f.round(2)
  end

  def self.send_confirmation
    MaterialMailer.with(rental: self).confirmation.deliver_now!
  end
end
