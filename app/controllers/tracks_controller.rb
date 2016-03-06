class TracksController < ApplicationController
  require 'soundcloud'

  def index
    client = Soundcloud.new(:client_id => '6d4b8e66ddd26d1f7df54714074db7aa')
    if params[:search]
      @tracks = client.get('/tracks', :q => params[:search] , :limit => 200 )
    else
      @tracks = client.get('/tracks', :q => 'traviscott' , :limit => 100 )
    end
  end
end
