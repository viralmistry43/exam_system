require 'rails_helper'

RSpec.describe Exam, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:subjects) }
    it { is_expected.to have_many(:topics).through(:subjects) }
    it { is_expected.to have_many(:chapters).through(:topics) }
    it { is_expected.to have_many(:questions).through(:chapters) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_presence_of(:date) }
  end
end
