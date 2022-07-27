class CreateFavoriteArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_artists do |t|
      t.integer :customer_id,  null: false
      t.integer :artist_id,    null: false

      t.timestamps
    end
  end
end
