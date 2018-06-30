# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    commentable = Material.find(comment_params[:commentable_id])
    comment = Comment.create!(
      user: current_user,
      text: comment_params[:text],
      commentable: commentable
    )

    render status: :created, json: comment
  end

  private

  def comment_params
    params.require(:comment).permit!
  end
end
