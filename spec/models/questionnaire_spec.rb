# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  subject(:questionnaire) do
    described_class.new(
      name: 'Foo',
      about_type: 'Supplier',
      driver: 'first_driver',
      sorting: 123
    )
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :about_type }
  it { is_expected.to validate_presence_of :driver }
  it { is_expected.to validate_presence_of :sorting }
end
