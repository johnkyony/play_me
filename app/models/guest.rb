class Guest < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  validates :user, presence: true
end
