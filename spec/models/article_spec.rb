require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(10) }
  end

  describe 'modules' do
    it 'includes the Visible module' do
      expect(described_class.included_modules).to include(Visible)
    end
  end
end
