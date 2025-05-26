require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:article) }
  end

  describe 'modules' do
    it 'includes the Visible module' do
      expect(described_class.included_modules).to include(Visible)
    end
  end
end
