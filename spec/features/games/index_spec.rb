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

  describe "I visit '/parents/:id'" do
    it "can display new game link" do
      visit '/games'

      expect(page).to have_link 'new game', href: "/games/new"
    end
  end

  describe "I visit '/parents/:id'" do
    it "displays link to edit story" do
      game_1 = Game.create!(televised: false,
        stadium_name: "Wriggley",
        attendance: 20000)
      game_2 = Game.create!(televised: true,
        stadium_name: "Mile High",
        attendance: 30000)

      visit '/games'

      expect(page).to have_link 'update game', href: "/games/#{game_1.id}/edit"
      expect(page).to have_link 'update game', href: "/games/#{game_2.id}/edit"
    end
  end
end
