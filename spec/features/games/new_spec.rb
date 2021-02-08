require 'rails_helper'

RSpec.describe "games new page" do
  it "can create a new game" do
    game = Game.create!(televised: false,
                        stadium_name: "Wriggley",
                        attendance: 20000)

    visit "/games/new"
    fill_in 'game[stadium_name]', with: 'Mead High School'
    fill_in 'game[attendance]', with: 500
    fill_in 'game[televised]', with: true

    click_button

    expect(page).to have_content("Mead High School")
    expect(current_path).to eq('/games')
  end
end
