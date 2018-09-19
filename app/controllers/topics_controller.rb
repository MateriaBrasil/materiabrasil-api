# frozen_string_literal: true

class TopicsController < ApplicationController
  def index
    topics = Topic.order(updated_at: :desc)
    render json: topics
  end
end
