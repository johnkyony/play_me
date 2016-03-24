class Party < ActiveRecord::Base
  belongs_to :user
  has_many :guests
  has_many :invitations
  has_many :playlists
  validates :user, presence: true
  validates :location , presence: true
  validates :occurence , presence: true
  validates :name , presence: true , uniqueness: true

  def self.attended_by(person)
    as_host = person.parties
    as_guest = Guest.where( user_id: person.id).map(&:party)
    as_host + as_guest
  end

end
