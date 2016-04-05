class GuestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_party, only: [:new, :create]
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  def index
    @guests = @party.guests
  end

  def new
    @guest = @party.guests.new
  end

  def create
    if @party.user_id == current_user.id
      @guest = @party.guests.build(guest_params)
      if @guest.save
        flash[:notice] = "#{@guest.user.name} joined the party."
        redirect_to party_path(@party)
      else
        flash[:error] = "Please retry"
        render :new
      end
    else
      flash[:error] = "Your not allowed to add a guest since your not a host"
      redirect_to party_path(params[:party_id])
    end
   
  end

  def show
  end

  def destroy
    party = @guest.party
    name = @guest.user.name
    @guest.destroy
    flash[:notice] = "#{name} has been removed from this party."
    redirect_to party_path(party)
  end

  private
  def guest_params
    params.require(:guest).permit( :user_id , :party_id)
  end

  def set_party
    @party = Party.find(params[:party_id])
  end

  def set_guest
    @guest = Guest.find(params[:id])
  end
end
