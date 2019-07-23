# frozen_string_literal: true

class QuestionnairesController < ApplicationController
  def index
    render json: filtered_questionnaires
  end

  private

  def filtered_questionnaires
    if resource_type.present? && resource_id.present?
      filtered_as_json
    elsif resource_type.present? && resource_id.blank?
      unfiltered_as_json
    else
      Questionnaire.all.order(:sorting).as_json
    end
  end

  def filtered_as_json
    # Get Supplier or Material
    resource = resource_type.constantize.find(resource_id)
    Questionnaire.where(about_type: resource_type)
      .order(:sorting).as_json(resource)
  end

  def unfiltered_as_json
    Questionnaire.where(about_type: resource_type).order(:sorting).as_json
  end

  def resource_type
    params[:about_type]
  end

  def resource_id
    params[:about_id]
  end
end
