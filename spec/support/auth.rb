# frozen_string_literal: true

RSpec.shared_context 'with current_user' do
  let!(:current_user) do
    User.create!(
      email: 'foo@bar.com',
      first_name: 'Foo',
      last_name: 'Bar',
      password: 'foobarfoo',
      iugu_id: '1',
      admin: false
    )
  end
end

RSpec.shared_context 'with current_admin' do
  let!(:current_admin) do
    User.create!(
      email: 'admin@bar.com',
      first_name: 'admin',
      last_name: 'Bar',
      password: 'adminbaradmin',
      iugu_id: '1',
      admin: true
    )
  end
end

module JsonRequests
  def get(*args)
    super(*json_args(*args))
  end

  def post(*args)
    super(*json_args(*args))
  end

  def update(*args)
    super(*json_args(*args))
  end

  def patch(*args)
    super(*json_args(*args))
  end

  def put(*args)
    super(*json_args(*args))
  end

  def delete(*args)
    super(*json_args(*args))
  end

  def json_args(path, options = {}, with_headers = true)
    headers = with_headers ? json_headers : {}

    if defined?(current_admin) && current_admin.present?
      authenticated_endpoint(:current_admin, path, headers, options)
    elsif defined?(current_user) && current_user.present?
      authenticated_endpoint(:current_user, path, headers, options)
    else
      unauthenticated_endpoint(path, headers, options)
    end
  end

  private

  def json_headers
    { 'ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json' }
  end

  def authenticated_endpoint(type, path, headers, options)
    auth_headers = send(type).create_new_auth_token
    [path, { headers: auth_headers.merge(headers) }.deep_merge(options)]
  end

  def unauthenticated_endpoint(path, headers, options)
    [path, { headers: headers }.deep_merge(options)]
  end
end

RSpec.configure do |config|
  config.include JsonRequests, type: :request
end

RSpec.configure do |config|
  config.include_context 'with current_user'
end
