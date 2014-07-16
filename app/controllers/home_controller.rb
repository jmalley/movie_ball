class HomeController < ApplicationController
  def index
    if current_user
      @leagues = current_user.leagues
      @pending_invites = current_user.invitations.not_accepted.map{ |l| League.where("id = #{l.league_id}").first }
      # binding.pry
    else
      @leagues = []
    end
  end

  def member_join(current_user)
    @league.memberships << current_user
    redirect_to @league.show
  end


end
