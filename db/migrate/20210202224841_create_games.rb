class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.boolean :televised
      t.string :stadium_name
      t.integer :attendance
      t.timestamps
    end
  end
end
