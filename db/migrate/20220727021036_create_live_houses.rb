class CreateLiveHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :live_houses do |t|
      t.string :name,         null: false
      t.text :introduction,   null: false
      t.string :postal_code,  null: false
      t.string :address,      null: false
      t.float :latitude,      null: false
      t.float :longitude,     null: false
      t.text :official_url
      t.integer :status,      null: false, default: 0

      t.timestamps
    end
  end
end
