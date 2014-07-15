class Invite < ActiveRecord::Base
  validates :recipient_id, uniqueness: { scope: :league_id, message: "Already a member." }

  belongs_to :league
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

  before_save :check_user_existence

  def self.league_invites(league_id)
    where("league_id = #{league_id}")
  end

  def check_user_existence
    recipient = User.find_by_email(email)
    if recipient
      self.recipient_id = recipient.id
    end
  end

  def self.list_user_invites(user_id)
    where("recipient_id = #{user_id}")
  end

  def self.accept_invite(league_id, user_id)
    invite = where("league_id = #{league_id} AND recipient_id = #{user_id}").first
    invite.update_attributes(accepted: Time.now)
  end

end
