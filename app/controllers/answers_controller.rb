# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    answer = Answer.new(answer_params)
    authorize answer

    Answer.where(
      about_type: params[:about_type],
      about_id: params[:about_id],
      question_id: params[:question_id]
    ).delete_all

    answer.save!
    render status: :created, json: answer
  end

  def destroy
    answer = Answer.find(params[:id])
    authorize answer
    answer.destroy!

    render status: :ok, json: answer
  end

  private

  def answer_params
    params.require(:answer).permit!
  end
end
