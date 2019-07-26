# frozen_string_literal: true

class QuestionnairesController < ApplicationController
  before_action :authenticate_user!, only: :recalculate_topsis

  def index
    render json: FilterQuestionnaires.execute(params)[:payload]
  end

  def recalculate_topsis
    authorize Questionnaire

    CalculateAllTopsisJob.perform_later
    render status: :created, json: { ok: true }
  end
end
