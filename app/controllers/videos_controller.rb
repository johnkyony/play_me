class VideosController < ApplicationController  

  def index
    client = Yt::Collections::Videos.new
    @videos = client.where(q: params[:query])
  end
    
end

  

