class Spot < ActiveRecord::Base
	validates :lat, presence: true
	validates :lng, presence: true
	validates :address, presence: true
	validates :description, presence: true
	validates :date, presence: true
	validates :photo, length: { maximum: 255 }
	validates :volunteers_requested, presence: true

	has_many :spot_user_relationships, foreign_key: "spot_id", dependent: :destroy
	has_many :users, through: :spot_user_relationships, source: :user

end
