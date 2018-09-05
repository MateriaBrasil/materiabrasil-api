require 'rails_helper'

RSpec.describe MaterialCategory, type: :model do
  it { is_expected.to validate_presence_of :material }
  it { is_expected.to validate_presence_of :category }
end
