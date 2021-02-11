require 'rails_helper'

RSpec.describe "As a vistor" do
  describe "I visit /players" do
    it "Then I see the name of each player record in the system" do
      game_1 = Game.create!(televised: false,
                            stadium_name: "Wriggley",
                            attendance: 20000)
      game_2 = Game.create!(televised: false, stadium_name: "Coors", attendance: 25000)

      player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
      player_2 = game_1.players.create!(position: "RB", weight: 180, injured: true)
      player_3 = game_2.players.create!(position: "DB", weight: 195, injured: true)

      visit '/players'

      expect(page).to have_content(player_1.position)
      expect(page).to have_content(player_1.injured)
      expect(page).to have_content(player_1.weight)

      expect(page).to have_content(player_2.position)
      expect(page).to have_content(player_2.injured)
      expect(page).to have_content(player_2.weight)

      expect(page).to have_content(player_3.position)
      expect(page).to have_content(player_3.injured)
      expect(page).to have_content(player_3.weight)
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

      click_link "new player"

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

  describe "I visit the `players` index page" do
    it "has a link to edit that child's info" do
      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)
      player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
      visit "/players"
      click_link 'edit player'
      expect(current_path).to eq("/players/#{player_1.id}/edit")
    end
  end

  describe "I visit the `game players` index page" do
    it "has a link to edit that child's info" do
      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)
      player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
      visit "/games/#{game_1.id}/players"
      click_link 'edit player'
      expect(current_path).to eq("/players/#{player_1.id}/edit")
    end
  end

  describe "I visit the `players` index page" do
    it "has a link to delete that child's info" do
      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)
      player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)

      visit '/players'

      expect(page).to have_link 'Delete', href: "/players/#{player_1.id}"

      click_link 'Delete'

      expect(current_path).to eq("/players/")

      expect(page).to_not have_content(game_1.stadium_name)
    end
  end
end
