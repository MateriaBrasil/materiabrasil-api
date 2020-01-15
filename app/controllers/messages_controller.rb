# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message = Message.create!(message_params.merge(from: current_user))

    MessageMailer.with(message: message).email.deliver_later
    
    render json: message, status: :created
  end

  private

  def message_params
    params.require(:message).permit(:from_type, :from_id, :to_type, :to_id, :text)
  end
end
