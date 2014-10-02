class AddAfterDescToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :after_desc, :text
  end
end
