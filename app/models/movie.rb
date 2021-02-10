class Movie < ApplicationRecord
  belongs_to :video_store

  def self.available?(params)
    Movie.where("video_store_id = ? AND available = ?", params[:id], true)
  end
end
