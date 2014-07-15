class Invite < ActiveRecord::Base
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

end
