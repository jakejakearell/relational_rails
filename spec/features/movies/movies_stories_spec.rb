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
      movie_2 = video_store_1.movies.create!(name:"Rambo", available: false, year_filmed: 1989)
      movie_3 = video_store_2.movies.create!(name:"Alien", available: false, year_filmed: 1988)
      movie_4 = video_store_2.movies.create!(name:"Predator", available: true, year_filmed: 1990)

      visit "/video_stores/#{video_store_1.id}/movies/"

      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_1.available)
      expect(page).to have_content(movie_1.year_filmed)

      expect(page).to have_content(movie_2.name)
      expect(page).to have_content(movie_2.available)
      expect(page).to have_content(movie_2.year_filmed)

      save_and_open_page

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

      # game_1 = Game.create!(televised: false,
      #   stadium_name: "Wriggley",
      #   attendance: 20000)
      # player_1 = game_1.players.create!(position: "QB", weight: 210, injured: false)
      #
      # visit "players/#{player_1.id}"

      expect(page).to have_link 'update movie', href: "/movies/#{movie.id}/edit"

      click_link

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


  describe "when I visit a player show page" do
    it "can delete a player and send me back to player index" do

      game_1 = Game.create!(televised: false,
                            stadium_name: "Wriggley",
                            attendance: 20000)
      player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
      player_2 = game_1.players.create!(position: "RB", weight: 180, injured: true)

      visit "/players/#{player_1.id}"

      click_button

      expect(page).to_not have_content(player_1.position)
      expect(page).to have_content(player_2.position)
      expect(current_path).to eq('/players/')
    end
  end

  describe "I visit a games player index page" do
    it "then I see a link to create a new player " do
      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)
      player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
      player_2 = game_1.players.create!(position: "RB", weight: 180, injured: true)

      visit "/games/#{game_1.id}/players/"

      expect(page).to have_link 'new player', href: "/games/#{game_1.id}/players/new"

      click_link

      expect(current_path).to eq("/games/#{game_1.id}/players/new")

      fill_in 'player[position]', with: 'pitcher'
      fill_in 'player[weight]', with: 200
      fill_in 'player[injured]', with: true

      click_button

      expect(page).to have_content("pitcher")
      expect(page).to have_content(200)
      expect(page).to have_content(true)

      expect(current_path).to eq("/games/#{game_1.id}/players")
    end
  end
end
