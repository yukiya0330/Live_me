class ChangeDatatypetodaypriceOfLive < ActiveRecord::Migration[6.1]
  def up
    change_column :lives, :open_time, :time
    change_column :lives, :start_time, :time
  end
  
  def down
    change_column :lives, :open_time, :string
    change_column :lives, :start_time, :string
  end
end
