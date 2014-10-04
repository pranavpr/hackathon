class SpotsController < ApplicationController

	def index
		@spots = Spot.all
	end

	def report
		@spots = Spot.where.not(status: 1)
	end

	def show
		@spot = Spot.find(params[:id])
	end

	def edit
		@spot = Spot.find(params[:id])
	end

	def join
		@spots = Spot.where.not(status: 1)
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
		@spot = Spot.new(spot_params)    # Not the final implementation!
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
