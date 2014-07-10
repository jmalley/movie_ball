module ApplicationHelper

  def is_a_member?(league_id)

    @member = !Membership.where("user_id is #{current_user.id} AND league_id is #{league_id}").empty?

  end

end
