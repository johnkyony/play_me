class Playlist < ActiveRecord::Base
  belongs_to :party
  belongs_to :video
  belongs_to :user
  belongs_to :track
end
