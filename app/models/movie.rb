class Movie < ApplicationRecord
  belongs_to :video_store

  def self.available?(params)
    Movie.where("video_store_id = ? AND available = ?", params[:id], true)
  end

  def self.year?(params)
    Movie.where("video_store_id = ? AND year_filmed > ?", params[:id], params[:query])
  end

  def self.alphabetize(params)
    Movie.order(:name).where("video_store_id = ? AND available = ?", params[:id], true)
  end
end
