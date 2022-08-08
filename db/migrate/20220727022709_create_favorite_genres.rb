class CreateFavoriteGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_genres do |t|
      t.integer :customer_id, null: false
      t.integer :genre_id,    null: false

      t.timestamps
    end
  end
end
