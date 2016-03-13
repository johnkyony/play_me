class Guest < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  validates :user, presence: true 
  validates :party , presence: true 
  validates :user_id, uniqueness: {scope: :party_id}
end
