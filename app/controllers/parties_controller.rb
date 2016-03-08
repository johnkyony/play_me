class PartiesController < ApplicationController
 before_action :authenticate_user!

 def index
   @parties = Party.where(:user_id => current_user.id)

   @invitation = Guest.where(:user_id => current_user.id)
 end
 def new
   @party = Party.new
 end
 def show
   @party = Party.where(:id => params[:id])
 end
 def create
  @Party = Party.create(party_params)
  @Party.user_id = current_user.id
  @Party.save!   
  redirect_to parties_path
 end

 private
 def party_params
   params.require(:party).permit(:name , :password , :location , :user_id , :id )
   
 end
end
