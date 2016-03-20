class PlaylistsController < ApplicationController
  def index
    @playlist_videos = Playlist.where(:party_id => params[:party_id])
  
  end
end
