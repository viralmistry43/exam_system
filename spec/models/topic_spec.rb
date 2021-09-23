require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe 'association' do
    it { is_expected.to belong_to :subject }
    it { is_expected.to have_many(:chapters) }
    it { is_expected.to have_many(:questions).through(:chapters) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_presence_of(:topic_number) }
  end
end
