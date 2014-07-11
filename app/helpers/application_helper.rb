module ApplicationHelper

  def is_a_member?(league_id)

    @member = !Membership.where("user_id = #{current_user.id} AND league_id = #{league_id}").empty?

  end

end
