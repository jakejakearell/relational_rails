require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to :video_store }
  end
end
