class CreateSpotUserRelationships < ActiveRecord::Migration
  def change
    create_table :spot_user_relationships do |t|
      t.integer :spot_id
      t.integer :user_id

      t.timestamps
    end

    add_index :spot_user_relationships, :spot_id
    add_index :spot_user_relationships, :user_id
    add_index :spot_user_relationships, [:spot_id, :user_id], unique: true
  end
end
