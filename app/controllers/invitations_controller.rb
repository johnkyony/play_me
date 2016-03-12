class InvitationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_party, only: [:new, :create]
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  def index
    @invitations = @party.invitations
  end

  def new
    @invitation = @party.invitations.new
  end

  def create
    @invitation = @party.invitations.build(invitation_params)
    @invitation.sender_id = current_user.id
    if @invitation.save
      flash[:notice] = "#{@invitation.receiver.name} has been invited to the party"
        redirect_to party_path(@party)
    else
        flash[:error] = "Please retry"
        render :new
    end

  end

  def show
  end

  def destroy
    party = @invitation.party
    name = @invitation.receiver.name
    @invitation.destroy
    flash[:notice] = "#{name} has been removed from this party."
    redirect_to party_path(party)
  end

  private
  def invitation_params
    params.require(:invitation).permit( :party_id, :sender_id, :receiver_id, :status)
  end

  def set_party
    @party = Party.find(params[:party_id])
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

end
