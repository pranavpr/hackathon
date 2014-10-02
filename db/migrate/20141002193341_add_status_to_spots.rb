class AddStatusToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :status, :integer
  end
end
