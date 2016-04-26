class Track < ActiveRecord::Base
  has_many :playlist

  def self.search(search)
    where("name ILIKE ?" , "%#{search}%")
    
  end


end
