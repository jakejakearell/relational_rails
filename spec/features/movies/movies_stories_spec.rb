require 'rails_helper'

RSpec.describe "As a vistor" do
  describe "I visit /movies" do
    it "Then I see the name of each movie record in the system" do
      video_store_1 = VideoStore.create!(name: "Video 1",
                            rank: 1,
                            flagship_store: true)
      video_store_2 = VideoStore.create!(name: "Video 2",
                            rank: 2,
                            flagship_store: false)

      movie_1 = video_store_1.movies.create!(name:"Rent", available: true, year_filmed: 2001)
      movie_2 = video_store_1.movies.create!(name:"Rambo", available: false, year_filmed: 1989)
      movie_3 = video_store_2.movies.create!(name:"Alien", available: false, year_filmed: 1988)
      movie_4 = video_store_2.movies.create!(name:"Predator", available: true, year_filmed: 1990)

      visit '/movies'

      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_1.available)
      expect(page).to have_content(movie_1.year_filmed)

      expect(page).to have_content(movie_2.name)
      expect(page).to have_content(movie_2.available)
      expect(page).to have_content(movie_2.year_filmed)

      expect(page).to have_content(movie_3.name)
      expect(page).to have_content(movie_3.available)
      expect(page).to have_content(movie_3.year_filmed)

      expect(page).to have_content(movie_4.name)
      expect(page).to have_content(movie_4.available)
      expect(page).to have_content(movie_4.year_filmed)
    end
  end

  describe "I visit movie show video store movie index" do
    it "then I see the movies associated with that video store and their attributes" do
      video_store_1 = VideoStore.create!(name: "Video 1",
                            rank: 1,
                            flagship_store: true)
      video_store_2 = VideoStore.create!(name: "Video 2",
                            rank: 2,
                            flagship_store: false)

      movie_1 = video_store_1.movies.create!(name:"Rent", available: true, year_filmed: 2001)
      movie_2 = video_store_1.movies.create!(name:"Rambo", available: true, year_filmed: 1989)
      movie_3 = video_store_2.movies.create!(name:"Alien", available: false, year_filmed: 1988)
      movie_4 = video_store_2.movies.create!(name:"Predator", available: true, year_filmed: 1990)

      visit "/video_stores/#{video_store_1.id}/movies/"

      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_1.available)
      expect(page).to have_content(movie_1.year_filmed)

      expect(page).to have_content(movie_2.name)
      expect(page).to have_content(movie_2.available)
      expect(page).to have_content(movie_2.year_filmed)

      expect(page).to_not have_content(movie_3.name)
      expect(page).to_not have_content(movie_3.year_filmed)

      expect(page).to_not have_content(movie_4.name)
      expect(page).to_not have_content(movie_4.year_filmed)
    end
  end

  describe "I visit movie show page" do
    it "then I see the movie with that id and its attributes" do

      video_store = VideoStore.create!(name: "Video 1",
                            rank: 1,
                            flagship_store: true)

      movie = video_store.movies.create!(name:"Rent", available: true, year_filmed: 2001)

      visit "movies/#{movie.id}"

      expect(page).to have_content(movie.name)
      expect(page).to have_content(movie.available)
      expect(page).to have_content(movie.year_filmed)
    end
  end

  describe "when I visit a movie show page" do
    it "then I see a link to update the movie" do

      video_store = VideoStore.create!(name: "Video 1",
                            rank: 1,
                            flagship_store: true)

      movie = video_store.movies.create!(name:"Rent", available: true, year_filmed: 2001)

      visit "movies/#{movie.id}"

      expect(page).to have_link 'update movie', href: "/movies/#{movie.id}/edit"

      click_link 'update movie'

      expect(current_path).to eq("/movies/#{movie.id}/edit")

      fill_in 'movie[name]', with: 'Die Hard'
      fill_in 'movie[available]', with: false
      fill_in 'movie[year_filmed]', with: 1990

      click_button

      expect(page).to have_content("Die Hard")
      expect(page).to have_content(false)
      expect(page).to have_content(1990)

      expect(current_path).to eq("/movies/#{movie.id}")
    end
  end


  describe "when I visit a movie show page" do
    it "can delete a movie and send me back to movies index" do

      video_store = VideoStore.create!(name: "Video 1",
                            rank: 1,
                            flagship_store: true)

      movie_1 = video_store.movies.create!(name:"Rent", available: true, year_filmed: 2001)
      movie_2 = video_store.movies.create!(name:"Rambo", available: false, year_filmed: 1989)

      visit "/movies/#{movie_1.id}"

      click_button

      expect(page).to_not have_content(movie_1.name)
      expect(page).to have_content(movie_2.name)
      expect(current_path).to eq('/movies/')
    end
  end

  describe "I visit a video store movies index page" do
    it "then I see a link to create a new movie" do
      # game_1 = Game.create!(televised: false,
      #   stadium_name: "Wriggley",
      #   attendance: 20000)
      # player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
      # player_2 = game_1.players.create!(position: "RB", weight: 180, injured: true)

      video_store = VideoStore.create!(name: "Video 1",
                            rank: 1,
                            flagship_store: true)

      movie_1 = video_store.movies.create!(name:"Rent", available: true, year_filmed: 2001)
      movie_2 = video_store.movies.create!(name:"Rambo", available: false, year_filmed: 1989)


      visit "/video_stores/#{video_store.id}/movies/"

      expect(page).to have_link 'new movie', href: "/video_stores/#{video_store.id}/movies/new"

      click_link 'new movie'

      expect(current_path).to eq("/video_stores/#{video_store.id}/movies/new")

      fill_in 'movie[name]', with: 'Die Hard'
      fill_in 'movie[available]', with: true
      fill_in 'movie[year_filmed]', with: 1990

      click_button

      expect(page).to have_content("Die Hard")
      expect(page).to have_content(true)
      expect(page).to have_content(1990)

      expect(current_path).to eq("/video_stores/#{video_store.id}/movies")
    end
  end

  describe "I visit a store's movie page" do
    it "has a form to filter movies by year" do

      video_store_1 = VideoStore.create!(name: "Video 1",
                            rank: 1,
                            flagship_store: true)

      movie_1 = video_store_1.movies.create!(name:"Rent", available: true, year_filmed: 2001)
      movie_2 = video_store_1.movies.create!(name:"Rambo", available: false, year_filmed: 1989)
      movie_3 = video_store_1.movies.create!(name:"Alien", available: false, year_filmed: 1988)
      movie_4 = video_store_1.movies.create!(name:"Predator", available: true, year_filmed: 1990)


      visit "video_stores/#{video_store_1.id}/movies"

      fill_in 'query', with: '2000'

      click_button

      expect(page).to_not have_content(movie_2.name)
    end
  end

  describe "I visit '/video_stores/'" do
    it "displays link to edit game" do
      video_store = VideoStore.create!(name: "Video 1",
                            rank: 1,
                            flagship_store: true)

      visit '/video_stores'

      expect(page).to have_link 'update store', href: "/video_stores/#{video_store.id}/edit"
    end
  end

  describe "I visit '/games/'" do
    it "displays link to delete game" do
      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)

      visit '/games'

      expect(page).to have_link 'Delete', href: "/games/#{game_1.id}"

      click_link 'Delete', href: "/games/#{game_1.id}"

      expect(current_path).to eq("/games/")

      expect(page).to_not have_content(game_1.stadium_name)
    end
  end

end
