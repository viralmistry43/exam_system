require 'rails_helper'

RSpec.describe Chapter, type: :model do
  describe 'association' do
    it { is_expected.to belong_to :topic }
    it { is_expected.to have_many(:questions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_presence_of(:chapter_number) }
  end
end
