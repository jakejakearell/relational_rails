require 'rails_helper'

describe VideoStore, type: :model do
  describe 'relationships' do
    it { should have_many :movies }
  end
end
