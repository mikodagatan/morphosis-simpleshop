require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5).is_at_most(255) }
    it { should validate_presence_of(:stock) }
    it { should validate_numericality_of(:stock).is_greater_than_or_equal_to(0) }
  end
end
