class AddVolunteersToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :volunteers_requested, :integer,:default => 0
    add_column :spots, :volunteers_pleged, :integer, :default => 0
  end
end
