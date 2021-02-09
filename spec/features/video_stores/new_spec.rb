require 'rails_helper'

RSpec.describe "video stores new page" do
  it "can create a new video store" do
    video_store = VideoStore.create!(name: "Video 1",
                          rank: 1,
                          flagship_store: true)

    visit "/video_stores/new"
    fill_in 'video_store[name]', with: 'Videozzz'
    fill_in 'video_store[rank]', with: 5
    fill_in 'video_store[flagship_store]', with: false

    click_button

    expect(page).to have_content("Videozzz")
    expect(current_path).to eq('/video_stores')
  end
end
