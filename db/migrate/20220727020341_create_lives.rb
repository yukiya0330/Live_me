class CreateLives < ActiveRecord::Migration[6.1]
  def change
    create_table :lives do |t|
      t.string :name,         null: false
      t.text :introduction,   null: false
      t.date :live_date,      null: false
      t.integer :open_time
      t.integer :start_time
      t.integer :advance_price
      t.integer :today_price
      t.integer :status,      null: false, default: 0

      t.timestamps
    end
  end
end
