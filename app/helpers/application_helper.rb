module ApplicationHelper

  def is_a_member?(league_id)
    @member = !Membership.where("user_id = #{current_user.id} AND league_id = #{league_id}").empty?
  end

  def is_owner?(league_id)
    @owner = !League.where("owner_id = #{current_user.id} AND id = #{league_id}").empty?
  end

  def movie_taken?(rotten_id_i, league_id)
    @movie = !Movie.where("rotten_id = #{rotten_id_i.to_i} AND league_id = #{league_id.to_i}").empty?
  end

  def has_memberships?
    @member = !Membership.where("user_id = #{current_user.id}").empty?
  end


end
