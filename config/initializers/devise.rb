# frozen_string_literal: true

Devise.setup do |config|
  config.mailer_sender = 'cadastro@materiabrasil.net'
  config.navigational_formats = [:json]
  config.reset_password_within = 30.minutes
end
