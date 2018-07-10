# frozen_string_literal: true

class CommentsController < ApplicationController
  include PolymorphicFind

  before_action :authenticate_user!

  def create
    comment = Comment.create!(
      user: current_user,
      text: comment_params[:text],
      commentable: polymorphic_find('commentable')
    )

    render status: :created, json: comment
  end

  private

  def comment_params
    params.require(:comment).permit!
  end
end
