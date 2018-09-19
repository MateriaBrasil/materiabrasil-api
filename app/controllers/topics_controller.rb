# frozen_string_literal: true

class TopicsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def index
    topics = Topic.order(updated_at: :desc)
    render json: topics
  end

  def create
    topic = Topic.create!(
      user: current_user,
      subject: topic_params[:subject],
      text: topic_params[:text]
    )

    render status: :created, json: topic
  end

  private

  def topic_params
    params.require(:topic).permit!
  end
end
