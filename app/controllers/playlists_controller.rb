class PlaylistsController < ApplicationController
 
  before_action :authenticate_user!
  before_action :set_party, only: [:new, :create]
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = @party.playlists
  end

  def new
    @playlist = @party.playlists.new
    client = Soundcloud.new(:client_id => '6d4b8e66ddd26d1f7df54714074db7aa')    
    @tracks = client.get('/tracks', :limit => 100, :order => 'hotness')
  end

  def create
    client = Soundcloud.new(:client_id => '6d4b8e66ddd26d1f7df54714074db7aa')
    if params[:query]
      @tracks = client.get('/tracks', :q => params[:query] , :limit => 200 )
    else
      @tracks = client.get('/tracks', :limit => 100, :order => 'hotness')
    end
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
    params.require(:playlist).permit( :track_id ,:video_id , :party_id)
  end

  def set_party
    @party = Party.find(params[:party_id])
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

end

