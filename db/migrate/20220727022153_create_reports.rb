class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :customer_id,          null: false
      t.integer :performing_artist_id, null: false
      t.text :comment,                null: false

      t.timestamps
    end
  end
end
