# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    answer = Answer.create!(answer_params)
    render status: :created, json: answer
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy!
    render status: :ok, json: answer
  end

  private

  def answer_params
    params.require(:answer).permit!
  end
end
