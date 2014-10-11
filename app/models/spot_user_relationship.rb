class SpotUserRelationship < ActiveRecord::Base

  belongs_to :spot, class_name: "Spot"
  belongs_to :user, class_name: "User"

  validates :spot_id, presence: true
  validates :user_id, presence: true
end
