class AddAfterPhotoToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :after_photo, :string
  end
end
