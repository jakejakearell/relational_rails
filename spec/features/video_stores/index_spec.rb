require 'rails_helper'

RSpec.describe "As a vistor" do
  describe "I visit /video_stores" do
    it "Then I see the name of each video store record in the system" do
      video_store_1 = VideoStore.create!(name: "Video 1",
                            rank: 1,
                            flagship_store: true)
      video_store_2 = VideoStore.create!(name: "Video 2",
                            rank: 2,
                            flagship_store: false)

      visit '/video_stores'

      expect(page).to have_content(video_store_1.name)
      expect(page).to have_content(video_store_2.name)
    end
  end

  describe "I visit '/parents/:id'" do
    it "can display new video store link" do
      visit '/video_stores'

      expect(page).to have_link 'new video store', href: "/video_stores/new"
    end
  end
end
