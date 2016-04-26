class Track < ActiveRecord::Base
  has_many :playlist

  def self.search(search)
    where("name LIKE ?" , "%#{search}%")
    
  end


end
