class SpotUserRelationshipsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :ensure_signup_complete
  def create
    @spot = Spot.find(params[:spot_user_relationship][:spot_id])
    current_user.join!(@spot)
    flash[:notice] = "Joined sucessfully"
    redirect_to :back
  end

  def destroy
    @spot = SpotUserRelationship.find(params[:id]).spot
    current_user.unjoin!(@spot)
    flash[:notice] = "Unjoined sucessfully"
    redirect_to :back
  end
end
