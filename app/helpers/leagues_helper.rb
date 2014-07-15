module LeaguesHelper
  def is_invited?(league_id)
    @invitee = !Invite.where("recipient_id = #{current_user.id} AND league_id = #{league_id}").empty?
  end
end
