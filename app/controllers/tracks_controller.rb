class TracksController < ApplicationController
 

  def index
    @tracks = Track.all
    if params[:search]
      @tracks = Track.search(params[:search]).order("created_at Desc")
      
    else
      @tracks = Track.all.order('created_at DESC')
    end

  end
  
end
