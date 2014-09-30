class Spot < ActiveRecord::Base
	validates :lat, presence: true
	validates :lng, presence: true
	validates :address, presence: true
	validates :description, presence: true
	validates :date, presence: true
	validates :photo, length: { maximum: 255 }
end
