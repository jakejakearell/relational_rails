require 'rails_helper'

RSpec.describe "As a vistor" do
  describe "I visit /games" do
    it "Then I see the name of each game record in the system" do
      game_1 = Game.create!(televised: false,
                            stadium_name: "Wriggley",
                            attendance: 20000)
      game_2 = Game.create!(televised: true,
                            stadium_name: "Mile High",
                            attendance: 30000)

      visit '/games'

      expect(page).to have_content(game_1.stadium_name)
      expect(page).to have_content(game_2.stadium_name)
    end
  end

  describe "I visit '/games/:id'" do
    it "then I see the game with that id and its attributes" do

      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)

      visit "games/#{game_1.id}"

      expect(page).to have_content(game_1.stadium_name)
      expect(page).to have_content(game_1.attendance)
      expect(page).to have_content(game_1.televised)
    end
  end

  describe "I visit '/games'" do
    it "then I see a link to create a new game record" do
      visit "games/"

      expect(page).to have_link 'new game', href: "/games/new"

      click_link 'new game'

      expect(current_path).to eq('/games/new')

      fill_in 'game[stadium_name]', with: 'Mead High School'
      fill_in 'game[attendance]', with: 500
      fill_in 'game[televised]', with: true

      click_button

      expect(page).to have_content("Mead High School")
      expect(current_path).to eq('/games')
    end
  end


  describe "when I visit a game show page" do
    it "then I see a link to update the game" do

      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)

      visit "/games/#{game_1.id}"
      expect(page).to have_link 'update game', href: "/games/#{game_1.id}/edit"

      click_link 'update game'

      expect(current_path).to eq("/games/#{game_1.id}/edit")

      fill_in 'game[stadium_name]', with: 'MetLife'
      fill_in 'game[attendance]', with: 500
      fill_in 'game[televised]', with: true

      click_button

      expect(page).to have_content("MetLife")
      expect(page).to have_content(500)
      expect(page).to have_content(true)

      expect(current_path).to eq("/games/#{game_1.id}")
    end
  end

  describe "when I visit a games show page" do
    it "can delete a game and send me back to game index" do

      game = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)

      visit "/games/#{game.id}"

      click_button

      expect(page).to_not have_content(game.stadium_name)
      expect(current_path).to eq('/games/')
    end
  end

  # desribe "When I visit any page on the site" do
  #   it "shows a link at the top of the page that takes me to the game page" do
  #
  #   end
  # end

  describe "When I visit a games show page" do
    it "shows a link that takes me to players" do
      game = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)

      visit "/games/#{game.id}"

      expect(page).to have_link 'players', href: "/games/#{game.id}/players"

      click_link 'players'

      expect(current_path).to eq("/games/#{game.id}/players")
    end
  end
end
