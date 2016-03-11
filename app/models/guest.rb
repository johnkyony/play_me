class Guest < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  validates :user, presence: true 
  validates :party , presence: true
end
