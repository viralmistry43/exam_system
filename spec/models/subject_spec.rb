require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'association' do
    it { is_expected.to belong_to :exam }
    it { is_expected.to have_many(:topics) }
    it { is_expected.to have_many(:chapters).through(:topics) }
    it { is_expected.to have_many(:questions).through(:chapters) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_presence_of(:standard) }
    it { is_expected.to validate_length_of(:standard).is_at_most(255) }
  end
end
