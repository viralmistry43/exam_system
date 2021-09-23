require 'rails_helper'

RSpec.describe QuestionOption, type: :model do
  describe 'association' do
    it { is_expected.to belong_to :question }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:option) }
    it { is_expected.to validate_length_of(:option).is_at_most(255) }
  end
end
