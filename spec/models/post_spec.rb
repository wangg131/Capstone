require 'rails_helper'

RSpec.describe Post, type: :model do
  describe Post do
    it { should validate_numericality_of(:price) }
  end
end
