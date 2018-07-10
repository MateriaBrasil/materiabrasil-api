# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.create!(
      user: current_user,
      rating: review_params[:rating],
      text: review_params[:text],
      reviewable: reviewable
    )

    render status: :created, json: review
  end

  private

  def reviewable
    reviewable_type = [Material].find do |type|
      type.name == params[:reviewable_type]
    end

    reviewable_type.find(params[:reviewable_id])
  end

  def review_params
    params.require(:review).permit!
  end
end
