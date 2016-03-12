class Party < ActiveRecord::Base
  belongs_to :user
  has_many :guests
  has_many :invitations
  validates :user, presence: true
  validates :location , presence: true
  validates :occurence , presence: true
  validates :name , presence: true , uniqueness: true
end
