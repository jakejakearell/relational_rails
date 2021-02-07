require 'rails_helper'

RSpec.describe "games show page" do
  it "can display all attributes of a game" do
    game = Game.create!(televised: false,
                          stadium_name: "Wriggley",
                          attendance: 20000)

    visit "/games/#{game.id}"

    expect(page).to have_content("#{game.televised}")
    expect(page).to have_content(game.stadium_name)
    expect(page).to have_content("#{game.attendance}")
    expect(page).to have_content("#{game.created_at}")
    expect(page).to have_content("#{game.updated_at}")
  end

  it "can display update link" do
    game = Game.create!(televised: false,
      stadium_name: "Wriggley",
      attendance: 20000)

    visit "/games/#{game.id}"

    expect(page).to have_link 'update game', href: "/games/#{game.id}/edit"
  end


  it "can display delete button" do
    game = Game.create!(televised: false,
      stadium_name: "Wriggley",
      attendance: 20000)

    visit "/games/#{game.id}"

    expect(page).to have_button 'delete'
  end

  it "can delete game" do
    game = Game.create!(televised: false,
      stadium_name: "Wriggley",
      attendance: 20000)

    visit "/games/#{game.id}"

    click_button

    expect(page).to_not have_content(game.stadium_name)
    expect(current_path).to eq('/games/')
  end
end
