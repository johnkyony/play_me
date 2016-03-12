class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :parties
  has_many :incoming_invitations, class_name: "Invitation" , foreign_key: :receiver_id
  has_many :outgoing_invitations, class_name: "Invitation" , foreign_key: :sender_id

  def set_default_role
    self.role ||= :user
  end

  def pending_invitations
    incoming_invitations.select{ |invitation| invitation.pending?}
  end

end
