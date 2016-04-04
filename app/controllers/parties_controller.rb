class PartiesController < ApplicationController
 before_action :authenticate_user!
 before_action :set_party, only: [:show, :delete, :edit, :update]

 def index
   @parties = Party.attended_by(current_user)    
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
  @playlist_videos = Playlist.where(:party_id => params[:party_id])

 end

 def edit
 end

 def update
  @party.update(party_params)
  if @party.save
    flash[:notice] = "The party was successfully updated"
    redirect_to party_path(params[:id])
  else
    render 'edit'
    flash[:notice] = "Something that went wrong please try again"
  end

 end

 private

def party_params
   params.require(:party).permit(:name , :password , :location , :user_id , :id, :occurence )
end

def set_party
    @party = Party.find(params[:id])
end

end
