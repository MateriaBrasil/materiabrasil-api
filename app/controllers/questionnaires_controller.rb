# frozen_string_literal: true

class QuestionnairesController < ApplicationController
  def index
    render json: Questionnaire
      .where(about_type: params[:about_type])
      .order(:sorting)
  end
end
