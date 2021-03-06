module ApplicationHelper

  def is_a_member?(league_id)
    @member = !Membership.where("user_id = #{current_user.id} AND league_id = #{league_id}").empty?
  end

  def is_owner?(league_id)
    @owner = !League.where("owner_id = #{current_user.id} AND id = #{league_id}").empty?
  end

  def is_a_studio_owner?(studio_id)
    @owner = !StudioOwnership.where("user_id = #{current_user.id} AND studio_id = #{studio_id}").empty?
  end

  def has_a_studio?(leagueid)
    @user = !StudioOwnership.where("user_id = #{current_user.id}").empty?
  end

  def has_a_studio_in_this_league?(leagueid)
     @user = !StudioOwnership.where("league_id = #{leagueid} AND user_id = #{current_user.id}").empty?
  end

  def movie_taken?(rotten_id_i, league_id)
    @movie = !Movie.where("rotten_id = #{rotten_id_i} AND league_id = #{league_id}").empty?
  end

  def has_memberships?
    @member = !Membership.where("user_id = #{current_user.id}").empty?
  end

  def randomized_background_image
    images = "https://s3.amazonaws.com/StaticMovieAssets/BG+Images/#{rand(17)}.jpg"
  end

end
