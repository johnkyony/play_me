class VideosController < ApplicationController

  def index
    @videos = Video.where(:party_id => params[:party_id])
    
  end
end
