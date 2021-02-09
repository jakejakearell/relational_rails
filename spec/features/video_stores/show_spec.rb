require 'rails_helper'

RSpec.describe "video stores show page" do
  it "can display all attributes of a video" do
    video_store = VideoStore.create!(name: "Video 1",
                          rank: 1,
                          flagship_store: true)

    visit "/video_stores/#{video_store.id}"

    expect(page).to have_content("#{video_store.name}")
    expect(page).to have_content("#{video_store.rank}")
    expect(page).to have_content("#{video_store.flagship_store}")
    expect(page).to have_content("#{video_store.created_at}")
    expect(page).to have_content("#{video_store.updated_at}")
  end

  it "can display update link" do
    video_store = VideoStore.create!(name: "Video 1",
                          rank: 1,
                          flagship_store: true)

    visit "/video_stores/#{video_store.id}"

    expect(page).to have_link 'update store', href: "/video_stores/#{video_store.id}/edit"
  end


  it "can display delete button" do
    video_store = VideoStore.create!(name: "Video 1",
                          rank: 1,
                          flagship_store: true)

    visit "/video_stores/#{video_store.id}"

    expect(page).to have_button 'delete'
  end

  it "can delete game" do
    video_store = VideoStore.create!(name: "Video 1",
                          rank: 1,
                          flagship_store: true)

    visit "/video_stores/#{video_store.id}"

    click_button

    expect(page).to_not have_content(video_store.name)
    expect(current_path).to eq('/video_stores/')
  end
end
