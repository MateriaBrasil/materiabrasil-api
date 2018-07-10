# frozen_string_literal: true

class ReviewsController < ApplicationController
  include PolymorphicFind

  before_action :authenticate_user!

  def create
    review = Review.create!(
      user: current_user,
      rating: review_params[:rating],
      text: review_params[:text],
      reviewable: polymorphic_find('reviewable')
    )

    render status: :created, json: review
  end

  private

  def review_params
    params.require(:review).permit!
  end
end
