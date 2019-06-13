# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { build(:message) }
  it { is_expected.to be_valid }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end
