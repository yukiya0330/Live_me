class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :live_houses, :latitude, true
    change_column_null :live_houses, :longitude, true
  end
end
