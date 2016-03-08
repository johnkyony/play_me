class GuestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @guests = Guest.where(:party_id => params[:party_id])
    
  end
  def new
    
    @guest = Guest.new
    
    
  end
  def create   
    @guest = Guest.create(guest_params) 
    # @guest.user_id = params[:user_id]
    # @guest.party_id = params[:party_id]
    if @guest.save!
        flash[:notice] = "The guest has been saved"
        redirect_to :back
      else
        flash[:alert] = "The guest has not been saved"
        redirect_to :back
      end
  end
  private
  def guest_params
    params.require(:guest).permit( :user_id , :party_id)
    
  end
end
