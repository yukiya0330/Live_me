class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name,       null: false
      t.text :introduction, null: false
      t.text :official_url
      t.integer :status,    null: false, default: 0

      t.timestamps
    end
  end
end
