# frozen_string_literal: true

class FilterQuestionnaires
  def self.execute(*args, &block)
    new(*args, &block).execute
  end

  def initialize(params)
    @resource_type = params[:about_type]
    @resource_id = params[:about_id]
  end

  def execute
    { success: true, payload: filtered_questionnaires }
  end

  private

  def filtered_questionnaires
    return Questionnaire.all.order(:sorting).as_json if @resource_type.blank?

    @resource_id.present? ? filtered_as_json : unfiltered_as_json
  end

  def filtered_as_json
    # Get Supplier or Material
    type_of_company = @resource_type.constantize.find(@resource_id)
      .type_of_company

    Questionnaire.where(about_type: @resource_type)
      .order(:sorting).as_json(type_of_company: type_of_company)
  end

  def unfiltered_as_json
    Questionnaire.where(about_type: @resource_type).order(:sorting).as_json
  end
end
