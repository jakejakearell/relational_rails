class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :position
      t.boolean :injured
      t.integer :weight

      t.timestamps
    end
  end
end
