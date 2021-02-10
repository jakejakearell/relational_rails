class VideoStore < ApplicationRecord
  has_many :movies

  def self.order_by_created_date
    VideoStore.order(created_at: :desc)
  end

  def self.number_of_movies(video_store_id)
    VideoStore.joins("INNER JOIN movies ON movies.video_store_id = video_stores.id").where("video_stores.id = ?", video_store_id).count
  end
end
