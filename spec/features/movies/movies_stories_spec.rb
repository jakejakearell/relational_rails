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

  describe "I visit player show game player index" do
    it "then I see the players associated with that game and their attributes" do
      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)
      game_2 = Game.create!(televised: false, stadium_name: "Coors", attendance: 25000)

      player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
      player_2 = game_1.players.create!(position: "RB", weight: 180, injured: true)
      player_3 = game_2.players.create!(position: "DB", weight: 195, injured: true)

      visit "/games/#{game_1.id}/players/"

      expect(page).to have_content(player_1.position)
      expect(page).to have_content(player_1.injured)
      expect(page).to have_content(player_1.weight)

      expect(page).to have_content(player_2.position)
      expect(page).to have_content(player_2.injured)
      expect(page).to have_content(player_2.weight)

      expect(page).to_not have_content(player_3.position)
      expect(page).to_not have_content(player_3.weight)
    end
  end

  describe "I visit player show page" do
    it "then I see the player with that id and its attributes" do

      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)
      player_1 = game_1.players.create!(position: "QB", weight: 210, injured: false)

      visit "players/#{player_1.id}"

      expect(page).to have_content(player_1.position)
      expect(page).to have_content(player_1.injured)
      expect(page).to have_content(player_1.weight)
    end
  end

  describe "when I visit a player show page" do
    it "then I see a link to update the player" do

      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)
      player_1 = game_1.players.create!(position: "QB", weight: 210, injured: false)

      visit "players/#{player_1.id}"

      expect(page).to have_link 'update player', href: "/players/#{player_1.id}/edit"

      click_link

      expect(current_path).to eq("/players/#{player_1.id}/edit")

      fill_in 'player[position]', with: 'RB'
      fill_in 'player[weight]', with: 500
      fill_in 'player[injured]', with: true

      click_button

      expect(page).to have_content("RB")
      expect(page).to have_content(500)
      expect(page).to have_content(true)

      expect(current_path).to eq("/players/#{player_1.id}")
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
