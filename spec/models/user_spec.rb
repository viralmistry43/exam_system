require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:answers) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
  end
end
