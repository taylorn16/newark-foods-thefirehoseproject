class AlterPhotosTableRenamePhotoFileToPhoto < ActiveRecord::Migration
  def change

    rename_column(:photos, :photo_file, :photo)

  end
end
