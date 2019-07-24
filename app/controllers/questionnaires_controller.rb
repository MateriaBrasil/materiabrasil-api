# frozen_string_literal: true

class QuestionnairesController < ApplicationController
  def index
    render json: FilterQuestionnaires.execute(params)[:payload]
  end
end
