class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.float :lat
      t.float :lng
      t.text :address
      t.string :photo
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
