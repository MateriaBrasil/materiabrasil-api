# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    answer = Answer.new(answer_params)
    authorize answer
    delete_previous_answer(params)
    answer.save!
    load_questionnaire(answer)
    trigger_topsis_calculation

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

  def delete_previous_answer(params)
    Answer.where(
      about_type: params[:about_type],
      about_id: params[:about_id],
      question_id: params[:question_id]
    ).delete_all
  end

  def load_questionnaire(answer)
    @questionnaire = answer.question.questionnaire
  end

  def supplier_or_material
    params[:about_type].constantize.find(params[:about_id])
  end

  def trigger_topsis_calculation
    return unless @questionnaire.completed_by(supplier_or_material)
    CalculateTopsisJob.perform_later(
      @questionnaire.driver, supplier_or_material
    )
  end
end
