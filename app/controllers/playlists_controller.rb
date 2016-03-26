class PlaylistsController < ApplicationController
 
  before_action :authenticate_user!
  before_action :set_party, only: [:new, :create]
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = @party.playlists
  end

  def new
    @playlist = @party.playlists.new
  end

  def create
    @playlist = @party.playlists.build(playlist_params)
    if @playlist.save
      flash[:notice] = "#{@playlist.video.title} has been added to the playlist."
        redirect_to party_path(@party)
    else
        flash[:error] = "Please retry"
        render :new
    end
  end

  def show
  end

  def destroy
    party = @playlist.party
    name = @playlist.video.name
    @playlist.destroy
    flash[:notice] = "#{name} has been removed from this playlist."
    redirect_to party_path(party)
  end

  private
  def playlist_params
    params.require(:playlist).permit( :video_id , :party_id)
  end

  def set_party
    @party = Party.find(params[:party_id])
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end
end

