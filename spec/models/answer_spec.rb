require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'association' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :question }
    it { is_expected.to belong_to(:question_option).optional }
  end
end
