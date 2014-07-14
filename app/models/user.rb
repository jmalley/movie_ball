class User < ActiveRecord::Base
  has_many :memberships
  has_many :leagues, :through => :memberships

  has_many :movies, :dependent => :destroy

  def movies_for(league)
    movies.where(league_id: league.id)
  end

  #has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
  #has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
