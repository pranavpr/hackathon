class SpotsController < ApplicationController
	def show
		@spot = Spot.find(params[:id])
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
      params.require(:spot).permit(:lat, :lng, :address, :photo, :description, :date)
    end
end
