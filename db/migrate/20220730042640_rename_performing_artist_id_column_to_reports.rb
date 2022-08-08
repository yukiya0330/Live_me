class RenamePerformingArtistIdColumnToReports < ActiveRecord::Migration[6.1]
  def change
    rename_column :reports, :performing_artist_id, :live_id
  end
end
