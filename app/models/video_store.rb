class VideoStore < ApplicationRecord
  has_many :movies

  def self.order_by_created_date
    VideoStore.order(created_at: :desc)
  end
end
