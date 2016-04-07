class TracksController < ApplicationController
  require 'soundcloud'

  def index
    client = Soundcloud.new(:client_id => '6d4b8e66ddd26d1f7df54714074db7aa')
    if params[:query]
      @tracks = client.get('/tracks', :q => params[:query] , :limit => 200 )
    else
      @tracks = client.get('/tracks', :limit => 100, :order => 'hotness')
    end
  end
end
