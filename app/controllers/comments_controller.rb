# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.create!(
      user: current_user,
      text: comment_params[:text],
      commentable: commentable
    )

    render status: :created, json: comment
  end

  private

  def commentable
    commentable_type = [Material].find do |type|
      type.name == params[:commentable_type]
    end

    commentable_type.find(params[:commentable_id])
  end

  def comment_params
    params.require(:comment).permit!
  end
end
