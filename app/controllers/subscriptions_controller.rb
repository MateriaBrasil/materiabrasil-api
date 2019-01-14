# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def create
    authorize Subscription
    iugu = Iugu::Integration.new(token: ENV['IUGU_API_TOKEN'])
    return render_error('seu pagamento') unless create_payment_method(iugu)
    iugu_subscription = create_iugu_subscription(iugu)
    return render_error('sua assinatura') unless iugu_subscription
    subscription = create_subscription(iugu_subscription['id'])
    redirect_to subscription
  end

  def show
    subscription = Subscription.find(params[:id])
    authorize subscription
    render json: subscription
  end

  def activate
    subscription = Subscription.find_by!(iugu_id: params[:data][:id])
    authorize subscription
    subscription.activate!
  end

  private

  def create_subscription(iugu_id)
    Subscription.create!(
      user: current_user,
      iugu_id: iugu_id
    )
  end

  def create_payment_method(iugu)
    iugu.payment_method.create(
      customer_id: current_user.iugu_id,
      token: params[:token]
    ).success?
  end

  def create_iugu_subscription(iugu)
    response = iugu.subscription.create(
      plan_identifier: 'monthly',
      customer_id: current_user.iugu_id
    )
    return unless response.success?
    response.json
  end

  def render_error(message)
    # flash[:failure] =
    #   "Ooops, alguma coisa deu errado com #{message} no Iugu. " \
    #   'Por favor, tente novamente mais tarde.'
    # redirect_to root_path
  end
end
