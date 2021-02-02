class CreateVideoStores < ActiveRecord::Migration[5.2]
  def change
    create_table :video_stores do |t|
      t.string :name
      t.integer :rank
      t.boolean :flagship_store
      t.timestamps
    end
  end
end
