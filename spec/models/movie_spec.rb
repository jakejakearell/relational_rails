require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to :video_store }
  end

  describe 'instance methods' do
    describe '#available?' do
      it 'returns only movies that are available to the child index' do
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

        params = {id: video_store_1.id}

        expect(Movie.available?(params)).to eq([movie_1])
      end
    end

    describe '#year?' do
      it "returns only movies that are more recent than the year entered by the user with results in the video store's show page" do

        video_store_1 = VideoStore.create!(name: "Video 1",
                                          rank: 1,
                                          flagship_store: true)
        video_store_2 = VideoStore.create!(name: "Video 2",
                                          rank: 2,
                                          flagship_store: false)

        movie_1 = video_store_1.movies.create!(name:"Rent", available: true, year_filmed: 2001)
        movie_2 = video_store_1.movies.create!(name:"Rambo", available: false, year_filmed: 1989)
        movie_3 = video_store_1.movies.create!(name:"Alien", available: true, year_filmed: 1988)
        movie_4 = video_store_2.movies.create!(name:"Predator", available: true, year_filmed: 1990)

        params = {id: video_store_1.id, query: 1988}

        expected = [movie_1, movie_2]

        expect(Movie.year?(params)).to eq(expected)
      end
    end
  end
end
