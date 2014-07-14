module ApplicationHelper

  def is_a_member?(league_id)
    @member = !Membership.where("user_id = #{current_user.id} AND league_id = #{league_id}").empty?
  end

  def movie_taken?(rotten_id_i, league_id)
    @movie = !Movie.where("rotten_id = #{rotten_id_i} AND league_id = #{league_id}").empty?
  end

  def has_memberships?
    @member = !Membership.where("user_id = #{current_user.id}").empty?
  end

end
