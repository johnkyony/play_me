class PartiesController < ApplicationController
 before_action :authenticate_user!
 before_action :set_party, only: [:show, :delete, :edit, :update]

 def index
   @parties = Party.where(:user_id => current_user.id)

   @invitation = Guest.where(:user_id => current_user.id)
 end

 def new
   @party = Party.new
 end


 def create
  @Party = Party.create(party_params)
  @Party.user_id = current_user.id
  if @Party.save
    flash[:notice] = 'A new Event has been successfully created.'
    redirect_to parties_path
  else
   redirect_to new_party_path
   flash[:success] = "A new Event was not created"
  end
 end

 def show
 end

 def edit
 end

 def update
 end

 private

def party_params
   params.require(:party).permit(:name , :password , :location , :user_id , :id, :occurence )
end

def set_party
    @party = Party.find(params[:id])
end

end
