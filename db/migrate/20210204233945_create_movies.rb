class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.boolean :available
      t.integer :year_filmed

      t.timestamps 
    end
  end
end
