class CreateBookmarkLives < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmark_lives do |t|
      t.integer :customer_id, null: false
      t.integer :live_id,     null: false

      t.timestamps
    end
  end
end
