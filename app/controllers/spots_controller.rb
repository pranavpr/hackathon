class SpotsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :reportspot, :joinspot, :update, :create]
	before_filter :ensure_signup_complete, only: [:new, :reportspot, :joinspot, :update, :create]

	def index
		@spots = Spot.all
	end

	def report
		@spots = Spot.where(status: 0)
	end

	def show
		@spot = Spot.find(params[:id])
	end

	def reportspot
		@spot = Spot.find(params[:id])
	end

	def join
		@spots = Spot.where(status: 0)
	end

	def joinspot
		@spot = Spot.find(params[:id])
	end

	def completed
		@spots = Spot.where(status: 1)
	end

	def update
		@spot = Spot.find(params[:id])
		if @spot.update_attributes(spot_params)
			flash[:success] = "Spot updated"
			redirect_to @spot
		else
			render 'edit'
		end
	end

	def new
		@spot = Spot.new
	end

	def create
		@spot = Spot.new(spot_params)
		if @spot.save
			flash[:success] = "Spot submitted sucessfully"
			redirect_to @spot
		else
			render 'new'
		end
	end

	private

	def spot_params
		params.require(:spot).permit(:lat, :lng, :address, :photo, :description, :date, :after_photo, :after_desc, :status)
	end
end
