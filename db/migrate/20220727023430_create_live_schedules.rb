class CreateLiveSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :live_schedules do |t|
      t.integer :live_id,       null: false
      t.integer :live_house_id, null: false

      t.timestamps
    end
  end
end
