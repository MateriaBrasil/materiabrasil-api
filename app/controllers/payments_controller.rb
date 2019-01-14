# frozen_string_literal: true

class PaymentsController < ApplicationController
  def new
    return if current_user.iugu_id
    iugu = Iugu::Integration.new(token: ENV['IUGU_API_TOKEN'])

    response = create(iugu)

    return render_error unless response.success?

    current_user.update! iugu_id: response.json['id']

    render status: :ok, json: response.json
  end

  private

  def create(iugu)
    iugu.customer.create(
      email: current_user.email,
      name: name
    )
  end

  def name
    "#{current_user.first_name} #{current_user.last_name}"
  end

  def render_error
    render status: :error, json: {
      id: 'error',
      message: 'Ooops, alguma coisa deu errado com seu cadastro no Iugu. ' \
      'Por favor, tente novamente mais tarde.'
    }
  end
end
