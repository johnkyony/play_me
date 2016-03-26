class PartiesController < ApplicationController
 before_action :authenticate_user!
 before_action :set_party, only: [:show, :delete, :edit, :update]

 def index
   @parties = Party.attended_by(current_user)    
 end

 def new
   @party = Party.new
 end

 # vir 
 # var
 # cir
 # car
 # dir
 # dar
 # yir
 # yar
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
  @playlist_videos = Playlist.where(:party_id => params[:party_id])
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
