require 'rails_helper'

RSpec.describe "games edit page" do
  # it "can display form to edit a game" do
  #   game = Game.create!(televised: false,
  #                       stadium_name: "Wriggley",
  #                       attendance: 20000)
  #
  #   visit "/games/#{game.id}/edit"
  #
  #   expect(page).to find_field('stadium name:').value
  # end

  it "can have forms filled out" do
    game = Game.create!(televised: false,
                        stadium_name: "Wriggley",
                        attendance: 20000)

    visit "/games/#{game.id}/edit"

    fill_in 'stadium_name', :with => 'MetLife'
    # fill_in('attendance', with: '30000')
    # fill_in('televised', with: 'true')

    save_and_open_page
  end
end
