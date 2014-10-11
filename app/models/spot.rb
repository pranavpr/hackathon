class Spot < ActiveRecord::Base
	validates :lat, presence: true
	validates :lng, presence: true
	validates :address, presence: true
	validates :description, presence: true
	validates :date, presence: true
	validates :photo, length: { maximum: 255 }

	has_many :spot_user_relationships, foreign_key: "spot_id", dependent: :destroy
	has_many :users, through: :spot_user_relationships, source: :user
def unjoin!(user)
	spot_user_relationships.find_by(user_id: user.id).destroy
end
end
