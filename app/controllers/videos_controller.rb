class VideosController < ApplicationController  

  def index
    client = Yt::Collections::Videos.new
    @videos = client.where(q: params[:query] ,  videoCategoryId: "10" )
  end
    
end

  

