class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :live_houses, :latitude, true
    change_column_null :live_houses, :longitude, true
    change_column_null :customers, :name, true
    change_column_null :customers, :nickname, true
  end
  
end
