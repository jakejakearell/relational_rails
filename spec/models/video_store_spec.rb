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
        video_store_3 = VideoStore.create!(name: "Video 3",
                                          rank: 2,
                                          flagship_store: false,
                                          created_at: "Wed Jun 04 12:35:19 -0700 2008")

        expected = [video_store_3, video_store_2, video_store_1]

        expect(VideoStore.order_by_created_date).to eq(expected)
      end
    end

    describe '#number_of_movies' do
      it "returns the number of movies in the video store's show page" do
        video_store_1 = VideoStore.create!(name: "Video 1",
                                          rank: 1,
                                          flagship_store: true)
        video_store_2 = VideoStore.create!(name: "Video 2",
                                          rank: 2,
                                          flagship_store: false)

        movie_1 = video_store_1.movies.create!(name:"Rent", available: true, year_filmed: 2001)
        movie_2 = video_store_1.movies.create!(name:"Rambo", available: false, year_filmed: 1989)
        movie_3 = video_store_1.movies.create!(name:"Alien", available: false, year_filmed: 1988)
        movie_4 = video_store_2.movies.create!(name:"Predator", available: true, year_filmed: 1990)

        video_store_id = video_store_1[:id]

        expect(VideoStore.number_of_movies(video_store_id)).to eq(3)
      end
    end
  end
end
