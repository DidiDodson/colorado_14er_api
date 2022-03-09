require 'rails_helper'

RSpec.describe Fourteener, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:english_name) }
    it { should validate_presence_of(:elevation) }
    it { should validate_numericality_of(:elevation) }
  end
end
