class PartiesController < ApplicationController
 before_action :authenticate_user!

 def index
   @parties = Party.all
 end
 def new
   @party = Party.new
 end
 def create
  @Party = Party.create(party_params)
  @Party.user_id = current_user.id
  @Party.save!   
  redirect_to parties_path
 end

 private
 def party_params
   params.require(:party).permit(:name , :password , :location , :user_id  )
   
 end
end
