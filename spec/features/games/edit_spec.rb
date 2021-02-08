require 'rails_helper'

RSpec.describe "games edit page" do
  it "can display form to edit a game" do
    game = Game.create!(televised: false,
                        stadium_name: "Wriggley",
                        attendance: 20000)

    visit "/games/#{game.id}/edit"
    fill_in 'game[stadium_name]', with: 'MetLife'
    fill_in 'game[attendance]', with: 500
    fill_in 'game[televised]', with: true

    click_button

    expect(page).to have_content("MetLife")
    expect(page).to have_content(500)
    expect(page).to have_content(true)
    
    expect(current_path).to eq("/games/#{game.id}")
  end
end
