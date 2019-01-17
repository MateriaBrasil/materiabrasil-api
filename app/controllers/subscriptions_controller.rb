# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :instance_iugu, only: %i[create]
  before_action :create_user, if: :user_dont_have_iugu_id, only: %i[create]

  def create
    authorize Subscription

    return render_error('seu pagamento') unless create_payment_method
    iugu_subscription = create_iugu_subscription

    return render_error('sua assinatura') unless iugu_subscription
    render status: :created, json: create_subscription(iugu_subscription['id'])
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

  def user_dont_have_iugu_id
    current_user.iugu_id.nil?
  end

  def instance_iugu
    @iugu = Iugu::Integration.new(token: ENV['IUGU_API_TOKEN'])
  end

  def create_user
    response = @iugu.customer.create(
      email: current_user.email,
      name: name
    )

    return render_error('criação usuário') unless response.success?
    current_user.update! iugu_id: response.json['id']
  end

  def name
    "#{current_user.first_name} #{current_user.last_name}"
  end

  def render_error(message)
    render status: :error, json: {
      id: 'error',
      message: "Ooops, alguma coisa deu errado com #{message} no Iugu. " \
        'Por favor, tente novamente mais tarde.'
    }
  end

  def create_subscription(iugu_id)
    Subscription.create!(
      user: current_user,
      iugu_id: iugu_id
    )
  end

  def create_payment_method
    @iugu.payment_method.create(
      customer_id: current_user.iugu_id,
      token: params[:token]
    ).success?
  end

  def create_iugu_subscription
    response = @iugu.subscription.create(
      plan_identifier: 'monthly',
      customer_id: current_user.iugu_id
    )
    return unless response.success?
    response.json
  end
end
