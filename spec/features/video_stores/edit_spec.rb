require 'rails_helper'

RSpec.describe "video store edit page" do
  it "can display form to edit a video store" do
    video_store = VideoStore.create!(name: "Video 1",
                          rank: 1,
                          flagship_store: true)

    visit "/video_stores/#{video_store.id}/edit"
    fill_in 'video_store[name]', with: 'Videozzz'
    fill_in 'video_store[rank]', with: 5
    fill_in 'video_store[flagship_store]', with: false

    click_button

    expect(page).to have_content("Videozzz")
    expect(page).to have_content(5)
    expect(page).to have_content(false)

    expect(current_path).to eq("/video_stores/#{video_store.id}")
  end
end
