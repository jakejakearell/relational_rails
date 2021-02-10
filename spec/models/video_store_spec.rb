require 'rails_helper'

describe VideoStore, type: :model do
  describe 'relationships' do
    it { should have_many :movies }
  end

  describe 'instance methods' do
    describe '#order_by_created_date' do
      it 'returns the games listed with most recently created first' do
        video_store_1 = VideoStore.create!(name: "Video 1",
                                          rank: 1,
                                          flagship_store: true,
                                          created_at: "Mon Jun 02 12:35:19 -0700 2008")
        video_store_2 = VideoStore.create!(name: "Video 2",
                                          rank: 2,
                                          flagship_store: false,
                                          created_at: "Tues Jun 03 12:35:19 -0700 2008")
        video_store_3 = VideoStore.create!(name: "Video 2",
                                          rank: 2,
                                          flagship_store: false,
                                          created_at: "Wed Jun 04 12:35:19 -0700 2008")

        expected = [video_store_3, video_store_2, video_store_1]

        expect(VideoStore.order_by_created_date).to eq(expected)
      end
    end
  end 
end
