class AddVideoStoresToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :video_store, foreign_key: true
  end
end
