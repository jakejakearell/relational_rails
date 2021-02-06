require 'rails_helper'

RSpec.describe "games index page" do
  it "can see all game stadium name, attendance and whether televised" do
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

  it "can display new game link" do
    visit '/games'

    expect(page).to have_link 'new game', href: "/games/new"
  end
end
