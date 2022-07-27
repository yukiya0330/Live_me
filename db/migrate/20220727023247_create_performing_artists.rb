class CreatePerformingArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :performing_artists do |t|
      t.integer :artist_id, null: false
      t.integer :live_id,   null: false

      t.timestamps
    end
  end
end
